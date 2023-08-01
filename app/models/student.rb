class Student < ApplicationRecord
  validates_presence_of :name

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :teachers, through: :courses


  # Instance Methods
  def number_of_enrollments
    enrollments.count
  end

  def average_grade
    enrollments.average(:grade)
  end
end