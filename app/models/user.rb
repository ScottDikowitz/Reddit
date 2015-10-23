class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  def self.generate_session_token!
    SecureRandom::urlsafe_base64(16)
  end
  attr_reader :password

  def ensure_session_token
    self.session_token ||= User.generate_session_token!
  end

  def reset_session_token!
    self.session_token = User.generate_session_token!
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end
end
