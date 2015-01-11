# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  note       :text             not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :note, :user_id, :track_id, presence: true
  validates :track_id, numericality: { greater_than: 0}
  belongs_to :user, class_name: "User", foreign_key: :user_id, primary_key: :id
  belongs_to :track

  def time_ago
    seconds = (Time.zone.now - self.updated_at).to_i # created_at and updated_at are ActiveSupport:TimeZone objects
    minutes = seconds / 60
    hours = minutes / 60
    days = hours / 24

    if days > 0
      return "#{days} #{pluralize(days, "day")} ago"
    elsif hours > 0
      return "#{hours} #{pluralize(hours, "hour")} ago"
    elsif minutes > 0
      return "#{minutes} #{pluralize(minutes, "minute")} ago"
    else
      return "#{seconds} #{pluralize(seconds, "second")} ago"
    end
  end

  def pluralize(number, word)
    if number > 1
      "#{word}s"
    else
      word
    end
  end
end
