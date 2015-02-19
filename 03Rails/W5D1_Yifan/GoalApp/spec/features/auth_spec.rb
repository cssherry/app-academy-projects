require 'rails_helper'



feature 'the signup process' do
  scenario 'has a new user page' do #This one needs scenario...
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      user = build(:user)
      fill_in 'username', :with => user.username
      fill_in 'password', :with => user.password
      click_on "Register"
      expect(page).to have_content "Welcome, #{ user.username }!"

    end
  end
end

feature "logging in" do

  it "shows username on the homepage after login" do
    visit new_session_url
    user = create(:user)

    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on 'Sign in'

    expect(page).to have_content "Welcome, #{ user.username }!"
  end
end

feature "logging out" do

  it "begins with logged out state" do
    user = create(:user)
    visit user_url(user)

    expect(page).to have_content "Please log in"
  end

  it "doesn't show username on the homepage after logout" do
    user = create(:user)
    visit new_session_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on 'Sign in'

    click_on 'Log out'
    expect(page).to have_content "Sign in!"
  end

end
