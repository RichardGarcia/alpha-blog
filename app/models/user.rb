class User < ActiveRecord::Base
  # change text to lowercase
  before_save { self.email = email.downcase }

  # association
  has_many :article

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

  has_secure_password
end