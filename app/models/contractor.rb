class Contractor < ApplicationRecord
    has_many :jobs, through: :job_applicants
    has_many :employers, through: :jobs
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :last_name, presence: true
    validates :first_name, presence: true
end
