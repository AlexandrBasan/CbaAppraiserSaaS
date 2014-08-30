class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  # Name Validation
  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  # E-mail Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  # Password Validation
  has_secure_password
  validates :password, length: {minimum: 6}

  # Current user enable in model
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
  # Current user enable in model

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
