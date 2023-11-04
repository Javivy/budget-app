require 'rails_helper'

RSpec.describe 'Create a new Category', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create!(email: 'nebocex224@wermink.com', name: 'Javier Vargas', password: '123456', confirmed_at: Time.now)
    @category_one = Group.create(
      user: @user,
      name: 'Food',
      icon: 'food'
    )
  end

  it 'Renders new HTML entity' do
    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'

    click_on 'Create a new Category'
    fill_in 'Name', with: 'Food'
    select 'food', from: 'group[icon]'

    click_on 'Create new Category'

    expect(page).to have_current_path('/groups')
    expect(page).to have_content('Food')
  end
end
