class Course < ApplicationRecord
  validates_presence_of :name

  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :teacher
end