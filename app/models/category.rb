class Category < ApplicationRecord
  has_many :jobs

  validates :name, uniqness: true
end
