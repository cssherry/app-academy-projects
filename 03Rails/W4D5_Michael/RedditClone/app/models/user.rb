# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
   validates :username, :password_digest, :session_token, presence: true

   after_initialize :ensure_session_token

   attr_reader :password

   has_many(
    :subs,
    class_name: "Sub",
    foreign_key: :mod_id,
    primary_key: :id
   )

   has_many :posts
   has_many :comments

   def self.find_by_credentials(username, password)
     user = User.find_by_username(username)
     user && user.is_password?(password) ? user : nil
   end

   def password=(password)
     @password = password
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     BCrypt::Password.new(self.password_digest).is_password?(password)
   end

   def ensure_session_token
     self.session_token ||= SecureRandom.base64(16)
   end

   def reset_session_token!
     self.session_token = SecureRandom.base64(16)
     self.save!
     self.session_token
   end

end
