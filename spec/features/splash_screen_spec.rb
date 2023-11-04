require 'rails_helper'

RSpec.describe 'Splash Screen', type: :feature do
  it 'displays in splash with Heading, and Login, Register buttons' do
    visit '/'
    expect(page).to have_content('WalletWizard')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end

  it 'Redirect to Sign In page when click on login button' do
    visit '/'
    click_on 'Sign In'
    expect(page).to have_content('Sign in to your account')
    expect(page).to have_content('Remember me')
    expect(page).to have_content('Forgot your password?')
  end

  it 'Redirects to the Sign Up page when clicking on the login button' do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_content('Create a new account')
  end
end
