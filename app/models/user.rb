class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  has_secure_token :confirm_token
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

  has_many :meetups
  has_many :comments

  def email_confirmed?
    confirmed_at ? true : false
  end
end
