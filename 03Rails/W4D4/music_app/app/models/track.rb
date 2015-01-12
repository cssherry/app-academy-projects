# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  type_track :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :name, :album_id, :type_track, presence: true
  validate :unique_track_name?

  belongs_to :album
  has_one :band, through: :album
  has_many :notes, dependent: :destroy

  private

  def unique_track_name?
    unless Track.where(name: self.name, album_id: self.album_id).empty? || self.persisted?
      errors[:name] << "has been taken"
    end
  end

end
