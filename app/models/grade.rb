class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :professor
  belongs_to :thesis
end
