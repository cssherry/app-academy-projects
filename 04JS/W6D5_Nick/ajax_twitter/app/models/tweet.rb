# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  has_many :mentions
  has_many :mentioned_users, through: :mentions, source: :user
  belongs_to :user

  validates :content, :user, presence: true
end
