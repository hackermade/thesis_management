class Thesis < ApplicationRecord
	belongs_to :student
  	belongs_to :professor, optional: true # Allow professor to be optional for pending theses
  	has_one :grade
  	has_one_attached :file
end
