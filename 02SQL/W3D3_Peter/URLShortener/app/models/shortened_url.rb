# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :long_url,  presence: true

  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  has_many(
    :visitors, -> { distinct },
    through: :visits,
    source: :visitor
  )

  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  has_many(:tag_topics, through: :taggings, source: :tag_topic)

  def self.random_code
    code = SecureRandom::urlsafe_base64(16)
    #useful to store full url in case of multiple domains.
    #Might even want separate domain column
    unless self.where("short_url LIKE '%#{code}%'").empty?
      raise RuntimeError.new('duplicate')
    end
    code
  rescue RuntimeError => e
    retry
  end

  def self.create_for_user_and_long_url!(submitter, long_url)
    code = self.random_code
    short_url = "localhost/#{code}"
    self.create!(long_url: long_url, short_url: short_url, submitter_id: submitter.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    # self.visits.select(:visitor_id).distinct.count
    self.visitors.count
  end

  def num_recent_uniques(time_period)
    recent_visits = self.visitors.where("created_at > ?", Time.now - time_period)
    recent_visits.distinct.count
  end
end
