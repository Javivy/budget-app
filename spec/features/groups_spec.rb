require 'rails_helper'

RSpec.describe 'Categories Page', type: :request do
  include Warden::Test::Helpers
  before(:each) do
    @user = User.create(
      name: 'Javier Vargas',
      email: 'nebocex224@wermink.com',
      password: '123456',
      confirmed_at: Time.now
    )
    @group = Group.create(
      user: @user,
      name: 'Food',
      icon: 'food'
    )
    @entity_mcdonalds = Entity.create(
      group: @group,
      author: @user,
      name: 'McDonalds',
      amount: 50
    )
    @entity_burgerking = Entity.create(
      author: @user,
      name: 'Burger King',
      amount: 75
    )
    login_as(@user, scope: :user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get groups_path
      expect(response).to be_successful
    end

    it 'renders a 200 response' do
      get groups_path
      expect(response).to have_http_status '200'
    end
    it 'can access to the a Group' do
      get group_path(@group)
      expect(response).to be_successful
    end

    it 'renders a index template' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'renders a show template' do
      get group_path(@group)
      expect(response).to render_template(:show)
    end
  end
end
