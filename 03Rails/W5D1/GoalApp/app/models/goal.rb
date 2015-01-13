class Goal < ActiveRecord::Base
  validates :user_id, :body, :status, presence: true
  validates :status, inclusion: ["public", "private"]

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :cheers
end
