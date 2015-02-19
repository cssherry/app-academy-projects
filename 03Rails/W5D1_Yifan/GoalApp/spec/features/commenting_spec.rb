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

  it 'allows user to comment on goals'  do
    visit goal_url(Goal.first)
    comment = build(:comment)

    fill_in 'Reply', with: comment.body
    click_on "Create comment"

    expect(page).to have_content(comment.body)
  end

  it 'allows user to comment on comments'  do
    visit goal_url(Goal.first)
    comment = build(:comment)


    fill_in 'Reply', with: comment.body
    click_on "Create comment"

    comment2 = build(:comment)

    click_on "Reply to comment"
    fill_in 'Reply', with: comment2.body
    click_on "Create comment"

    expect(page).to have_content(comment2.body)
  end

  it 'allows user to delete own comments'  do
    visit goal_url(Goal.first)
    comment = build(:comment)

    fill_in 'Reply', with: comment.body
    click_on "Create comment"

    click_on "Delete comment"

    expect(page).to_not have_content(comment.body)
  end

  it 'allows user to comment on users'  do
    visit user_url(User.last)
    comment = build(:comment)

    fill_in 'Reply', with: comment.body
    click_on "Create comment"

    expect(page).to have_content(comment.body)
  end

end
