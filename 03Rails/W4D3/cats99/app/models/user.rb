class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  validate :duplicate_name?
  attr_reader :password #needed for validation because validation uses a getter method

  after_initialize :ensure_session_token

  has_many :cats, dependent: :destroy
  has_many :cat_rental_requests, dependent: :destroy

  def ensure_session_token
    @session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    @session_token = SecureRandom::urlsafe_base64(16)
    self.class.update(self.id, session_token: @session_token)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credientials(username, password)
    user = self.where(username: username) #takes hashes
    return nil unless user

    if user.is_password?(password)
      return user
    else
      errors[:base] << "user not found"
    end
  end

  def requests_for_cat(cat)
    cat_rental_requests.where(cat_id: cat.id)
  end

  def approved_requests_made
    cat_rental_requests.where(status: "APPROVED")
  end

  def pending_requests_made
    cat_rental_requests.where(status: "PENDING")
  end

  private
  def duplicate_name?
    unless User.find_by(username: username).nil?
      errors[:username] << "has been taken"
    end
  end

end
