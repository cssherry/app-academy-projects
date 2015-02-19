class GoalComment < ActiveRecord::Base
  validates :goal_id, :body, presence: true
  belongs_to :goal
  belongs_to(
    :parent_comment,
    class_name: "GoalComment",
    foreign_key: :parent_id,
    inverse_of: :child_comments
    )

  has_many(
    :child_comments,
    class_name: "GoalComment",
    foreign_key: :parent_id,
    inverse_of: :parent_comment
    )


end
