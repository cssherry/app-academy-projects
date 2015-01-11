# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :email, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nul: true}
  validate :unique_email?

  has_many :notes, dependent: :destroy

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.find_unique_session_token
    user = User.find(self.id)
    user.update_attribute(:session_token, self.session_token)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) #Columns are not stored as instance variables. They simply have setter/getter methods
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user.nil? || !user.is_password?(password)
      nil
    else
      user
    end
  end

  def self.find_unique_session_token
    token = generate_session_token
    if User.find_by(session_token: token).nil?
      return token
    else
      find_unique_session_token
    end
  end

  private

  def unique_email?
    unless User.where(email: self.email).nil?
      errors[:email] << "already has an account"
    end
  end

end
