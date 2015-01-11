require 'date'

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validate :color_valid?
  validate :sex_valid?

  has_many :cat_rental_requests, dependent: :destroy 

  def age
    (Date.today - birth_date).to_i/365
  end

  private

  def color_valid?
    colors = %w(black brown white grey ginger calico)
    unless colors.include?(color)
      errors[:color] << "has to be 'black', 'brown', 'white', 'grey', 'ginger', or 'calico'"
    end
  end

  def sex_valid?
    sexes = ["M", "F"]
    unless sexes.include?(sex)
      errors[:sex] << "has to be 'M' or 'F'"
    end
  end

end
