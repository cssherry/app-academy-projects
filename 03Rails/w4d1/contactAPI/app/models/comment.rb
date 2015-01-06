# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  body             :text
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end
