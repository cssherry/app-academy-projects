# == Schema Information
#
# Table name: taggings
#
#  id           :integer          not null, primary key
#  tag_id       :integer          not null
#  short_url_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Tagging < ActiveRecord::Base
  belongs_to(
    :tag_topic,
    class_name: "TagTopic",
    foreign_key: :tag_id,
    primary_key: :id
  )

  belongs_to(
    :shortened_url,
    class_name: "ShortenedUrl",
    foreign_key: :short_url_id,
    primary_key: :id
  )

end
