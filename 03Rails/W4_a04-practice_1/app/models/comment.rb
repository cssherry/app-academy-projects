# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  link_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  validates :body, :user_id, :link_id, presence: true

  belongs_to :user,
             class_name: 'User',
             foreign_key: :user_id,
             primary_key: :id

  belongs_to :link,
             class_name: 'Link',
             foreign_key: :link_id,
             primary_key: :id

end
