module GoalsHelper
  def get_goals user
    if current_user == user
      current_user.goals
    else
      user.goals.where(status: 'public')
    end
  end
end
