require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create!(email: 'nebocex224@wermink.com', name: 'Javier Vargas', password: '123456', confirmed_at: Time.now)
    @category_one = Group.create(
      user: @user,
      name: 'Food',
      icon: 'food'
    )
    @category_two = Group.create(
      user: @user,
      name: 'Entertainment',
      icon: 'entertainment'
    )
    @transaction_one = Entity.create(
      group: @category_one,
      author: @user,
      name: 'Burger King',
      amount: 10
    )
    @transaction_two = Entity.create(
      group: @category_two,
      author: @user,
      name: 'Cinema with friends',
      amount: 50
    )
  end

  it 'Renders new HTML entity' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'

    click_on 'Food'
    click_on 'Create a new Transaction'
    fill_in 'Name', with: 'McDonalds'
    fill_in 'Amount', with: '35'
    select @category_one.name, from: 'entity[group_id]'

    click_on 'Create Transaction'

    expect(page).to have_current_path('/groups/1')
  end
end
