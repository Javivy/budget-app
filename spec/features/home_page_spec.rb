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
      name: 'McDonalds',
      amount: 35
    )
    @transaction_two = Entity.create(
      group: @category_one,
      author: @user,
      name: 'Burger King',
      amount: 10
    )
    @transaction_three = Entity.create(
      group: @category_two,
      author: @user,
      name: 'Cinema with friends',
      amount: 50
    )
  end

  it 'Whe user logs in, he is redirected to the categories page' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'

    expect(page).to have_current_path('/')
    expect(page).to have_content('Categories')
    expect(page).to have_content('Create a new Category')
    expect(page).to have_content('Food')
    expect(page).to have_content('Entertainment')
    expect(page).to have_content('Transactions')
  end

  it 'For each category the  user can see their name, and total amount of all transactions' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'

    expect(page).to have_content('Food')
    expect(page).to have_content('Entertainment')
    expect(page).to have_content('Transactions: 2')
    expect(page).to have_content('Transactions: 1')
  end

  it 'When user clicks on a category, he is redirected to the category page' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_on 'Food'
    expect(page).to have_current_path(group_path(@category_one))
  end

  it 'should redirect to add new category page when user clicks on new category button' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_on 'Create a new Category'
    # The we check that we are redirected to the new category page
    expect(page).to have_current_path(new_group_path)
  end
end