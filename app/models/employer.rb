class Employer < ApplicationRecord
    has_many :jobs
    has_many :applicants, through: :jobs
    has_many :contractors, through: :jobs
    has_secure_password
end
