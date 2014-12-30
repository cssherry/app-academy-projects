# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  short_url_id :integer          not null
#  visitor_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Visit < ActiveRecord::Base
  validates :short_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    short_url = ShortenedUrl.find_by(shortened_url: shortened_url)
    self.create!(short_url_id: short_url, visitor_id: user.id)
  end

  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :visitor_id,
    primary_key: :id
  )

  belongs_to(
    :visited_url,
    class_name: "ShortenedUrl",
    foreign_key: :short_url_id,
    primary_key: :id
  )
end
