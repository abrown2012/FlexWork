class Task < ApplicationRecord
  belongs_to :employer, class_name: "User", dependent: :destroy
  belongs_to :category
  
  validates :name , presence: true 
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :location_type, presence: true 
  validates :state, length: { is: 2 }
  validates :zip, length: { is: 5 }

end
