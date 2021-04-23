class User < ApplicationRecord
    has_many :tasks, foreign_key: "employer_id"
    has_many :tasks, foreign_key: "contractor_id"
    has_many :categories, through: :tasks 

    
    has_secure_password
    validates :password, confirmation: true, on: :create
    
    validates :email, presence: true, uniqueness: true
    validates :last_name, presence: true
    validates :first_name, presence: true

    scope :is_an_employer, -> { where(account_type: 2) }
    scope :is_a_contractor, -> { where(account_type: 1) }

    def full_name 
        "#{ self.first_name } #{ self.last_name }"
    end 
end
