class Article < ActiveRecord::Base
  # to prevent blank or null.
  #  min and max input
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}
end