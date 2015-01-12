# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  validates :name, presence: true
  validate :unique_band_name?

  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums, dependent: :destroy

  private

  def unique_band_name?
    unless Band.find_by(name: self.name).nil? || self.persisted?
      errors[:name] << "has already been used"
    end
  end
end
