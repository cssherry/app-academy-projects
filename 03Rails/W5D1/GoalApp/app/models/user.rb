class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  attr_reader :password

  after_initialize :ensure_session_token

  has_many :goals
  has_many :comments, as: :commentable
  has_many(
    :authored_comments,
    class_name: "Comment",
    foreign_key: :author_id,
    inverse_of: :author
    )
  has_many(
    :given_cheers,
    class_name: "Cheer",
    foreign_key: :awarder_id,
    inverse_of: :awarder
  )
  has_many(:cheers, through: :goals, source: :cheers)
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def is_password? password
    BCrypt::Password.new(password_digest).is_password? password
  end

  def self.find_by_credentials username, password
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
  end

end
