class Task < ApplicationRecord
  belongs_to :employer, class_name: "User"
  belongs_to :category
  
  
  
  validates :name , presence: true 
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :location_type, presence: true 
  validates :state, length: { is: 2 }
  validates :zip, length: { is: 5 }
  accepts_nested_attributes_for :category

  
  scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}

  def category_attributes=(attributes)
    if attributes[:name] != ""
        self.category = Category.find_or_create_by(name: attributes[:category])
        self.category.update(attributes)
    end
end

end
