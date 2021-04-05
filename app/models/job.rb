class Job < ApplicationRecord
  belongs_to :employer
  belongs_to :contractor
  belongs_to :category
end
