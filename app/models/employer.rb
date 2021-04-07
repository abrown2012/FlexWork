class Employer < ApplicationRecord
    has_many :jobs
    has_many :applicants, through: :jobs
    has_many :contractors, through: :jobs
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :last_name, presence: true
    validates :first_name, presence: true
end
