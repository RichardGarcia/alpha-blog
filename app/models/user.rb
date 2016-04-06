class User < ActiveRecord::Base
  # change text to lowercase
  before_save { self.email = email.downcase }

  has_secure_password
  
  # association
  has_many :articles

  # regex for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validations
  validates :username,
            presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: {case_sensitive: false}

  validates :email,
            presence: true,
            length: {maximum: 105},
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end