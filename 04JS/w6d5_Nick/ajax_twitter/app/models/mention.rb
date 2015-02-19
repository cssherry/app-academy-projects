# == Schema Information
#
# Table name: mentions
#
#  id         :integer          not null, primary key
#  tweet_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Mention < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  validates :tweet, :user, presence: true
  validates :user, uniqueness: { scope: :tweet }
end
