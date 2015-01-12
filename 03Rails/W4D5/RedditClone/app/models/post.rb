# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :post_subs,
    class_name: "PostSub",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  has_many :comments


end
