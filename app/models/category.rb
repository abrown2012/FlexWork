class Category < ApplicationRecord
    has_many :tasks
    has_many :employers, through: :tasks
    has_many :contractors, through: :tasks
    validates :name , presence: true 
end

