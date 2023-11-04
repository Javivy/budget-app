require 'rails_helper'

RSpec.describe EntitiesController, type: :request do
  # we include devise authenticaton helpers in next line
  include Warden::Test::Helpers
  before(:each) do
    # We set up variables to use in our tests
    @user = User.create(
      name: 'Javier',
      email: 'nebocex224@wermink.com',
      password: '123456',
      confirmed_at: Time.now
    )
    @group = Group.create(
      user: @user,
      name: 'Food',
      icon: 'food'
    )
    @entity_mcDonald = Entity.create(
      group: @group,
      author: @user,
      name: 'McDonald',
      amount: 50
    )
    # We autenticate the user usin devise test helpers
    login_as(@user, scope: :user)
  end
  describe 'GET /new' do
    it 'renders a successful response' do
      get new_entity_path
      expect(response).to be_successful
    end
    it 'renders a 200 response' do
      get new_entity_path
      expect(response).to have_http_status '200'
    end
    it 'renders a new template' do
      get new_entity_path
      expect(response).to render_template(:new)
    end
  end
end