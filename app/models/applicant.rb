class Applicant < ApplicationRecord
    has_many :jobs, through: :job_applicants
    has_many :employers, through: :jobs
    has_secure_password
end
