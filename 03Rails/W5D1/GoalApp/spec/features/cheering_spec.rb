require 'rails_helper'

feature 'comments' do
  before(:each) do
    user1 = create(:user)
    user2 = create(:user)

    goal =  build(:goal)
    User.first.goals << goal
    goal.save

    visit new_session_url
    fill_in 'username', :with => user1.username
    fill_in 'password', :with => user1.password
    click_on "Sign in"
  end

  it 'user can cheer other\'s goals' do
    visit goal_url(Goal.first)

    click_on "Cheer"

    expect(page).to have_content("1 cheer")
  end

  it 'user cannot cheer more than five times a day' do
    visit goal_url(Goal.first)

    click_on "Cheer"
    click_on "Cheer"
    click_on "Cheer"
    click_on "Cheer"
    click_on "Cheer"
    click_on "Cheer"
    expect(page).to have_content("5 cheer")
    expect(page).to have_content("Cannot cheer more")
  end
end
