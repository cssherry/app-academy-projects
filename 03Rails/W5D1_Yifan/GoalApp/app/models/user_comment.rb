class UserComment < ActiveRecord::Base
  validates :body, :user_id, presence: true

  belongs_to :user

  belongs_to(
  :parent_comment,
    class_name: "UserComment",
  foreign_key: :parent_id,
  inverse_of: :child_comments
  )

  has_many(
  :child_comments,
  class_name: "UserComment",
  foreign_key: :parent_id,
  inverse_of: :parent_comment
  )

end
