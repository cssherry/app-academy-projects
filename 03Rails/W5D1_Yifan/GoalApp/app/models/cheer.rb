class Cheer < ActiveRecord::Base
  validates :awarder_id, :goal_id, presence: true
  validate :max_daily_cheer

  belongs_to(
    :awarder,
    class_name: "User",
    inverse_of: :given_cheers
  )
  belongs_to :goal

  private
  def max_daily_cheer
    if awarder.given_cheers.where("created_at > ?", Time.zone.now - 86400).count >= 5
      errors[:base] << "Cannot cheer more"
    end
  end
end
