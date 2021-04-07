class Job < ApplicationRecord
  belongs_to :employer
  belongs_to :category
  has_many :contractors, through: :job_applicants
end
