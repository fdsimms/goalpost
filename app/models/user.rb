class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)

  end

  def reset_session_token!

  end

  def password=(password)

  end

  def is_password?(password)

  end

  private

  def ensure_session_token

  end
end
