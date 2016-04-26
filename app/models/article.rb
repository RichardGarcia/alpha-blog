class Article < ActiveRecord::Base
  # association
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  # validations
  # to prevent blank or null
  # min and max input
  validates :title,
            presence: true,
            length: {minimum: 3, maximum: 50}

  validates :description,
            presence: true,
            length: {minimum: 10, maximum: 500}

  validates :user_id,
            presence: true
end