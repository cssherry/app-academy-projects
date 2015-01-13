class Comment < ActiveRecord::Base
  validates :body, :commentable_id, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :authored_comments
  )
end
