# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  tag        :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base
  validates :tag, presence: true, length: {maximum: 200}

  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :tag_id,
    primary_key: :id
  )

  has_many(:shortened_urls, through: :taggings, source: :shortened_url)


  #TODO: incomplete, untested
  def most_popular_link
    TagTopic.shortened_urls.where("tag_topic = ?", self.tag).order("count(*)").limit(1)
  end
end
