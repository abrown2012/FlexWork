class Job < ApplicationRecord
  belongs_to :employer
  belongs_to :contractor, optional: true
  belongs_to :category
  has_many :applicants, through: :job_applicants
end
