require 'rails_helper'

feature 'goals' do
  before(:each) do
    user1 = create(:user)
    user2 = create(:user)

    visit new_session_url
    fill_in 'username', :with => user1.username
    fill_in 'password', :with => user1.password
    click_on "Sign in"
  end

  it 'user can create a goal' do
    visit new_goal_url
    goal = build(:goal)

    fill_in 'goal', with: goal.body
    click_on "Create goal"

    expect(page).to have_content(goal.body)
  end

  it 'user can update a goal' do
    goal =  build(:goal)
    User.first.goals << goal
    goal.save
    visit edit_goal_url(goal)
    fill_in 'goal', with: 'edited'
    click_on "Edit goal"

    expect(page).to have_content('edited')
  end

  it 'user can delete a goal' do
    goal =  build(:goal)
    User.first.goals << goal
    goal.save

    visit user_url(User.first)
    click_on "Delete"

    expect(page).to_not have_content(goal.body)
  end

  it 'user can view others private goals' do
    goal = build(:goal)
    User.last.goals << goal
    goal.save

    visit user_url(User.last)

    expect(page).to have_content(goal.body)
    expect(page).to have_content(User.last.username)
  end

  it 'user cannot view others private goals' do
    goal = build(:goal, status: 'private')
    User.last.goals << goal
    goal.save

    visit user_url(User.last)

    expect(page).to_not have_content(goal.body)
    expect(page).to have_content(User.last.username)
  end

  it 'user can view own private goals' do
    goal = build(:goal, status: 'private')
    User.first.goals << goal
    goal.save

    visit user_url(User.first)

    expect(page).to have_content(goal.body)
    expect(page).to have_content(User.first.username)
  end

  it 'user can mark goal as completed' do
    goal = build(:goal)
    User.first.goals << goal
    goal.save

    visit user_url(User.first)

    click_on "Finished"

    expect(Goal.first.completed).to eql("true") #Instance not updated, only database
  end
end
