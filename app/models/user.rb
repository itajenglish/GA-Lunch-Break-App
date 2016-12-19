class User < ApplicationRecord
  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true # password_confirmation attr
  validates_length_of :password, in: 3..20, on: :create
  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(name_or_email = '', login_password = '')
    user = if EMAIL_REGEX.match(name_or_email)
             User.find_by_email(name_or_email)
           else
             User.find_by_name(name_or_email)
           end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
end

  def match_password(login_password = '')
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
