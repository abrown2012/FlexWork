class Category < ApplicationRecord
    has_many :tasks
    has_many :employers, through: :tasks
    validates :name , presence: true 
end

