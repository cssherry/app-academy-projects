# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  type_album :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :name, :band_id, :type_album, presence: true
  validate :unique_album_name?

  belongs_to :band
  has_many :tracks, dependent: :destroy

  private

  def unique_album_name?
    unless Album.where(band_id: self.band_id, name: self.name).empty? || self.persisted? # For some reason, when you search multiple perameters, it will always return an object, so rather than searching "nil", need to search "empty"
      errors[:name] << "has already been taken"
    end
  end

end
