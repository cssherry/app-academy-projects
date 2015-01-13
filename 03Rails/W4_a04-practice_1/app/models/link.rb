# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :url, :title, presence: true

  has_many :comments,
           class_name: 'Comment',
           foreign_key: :link_id,
           primary_key: :id

end
