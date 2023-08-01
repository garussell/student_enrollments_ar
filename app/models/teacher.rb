class Teacher < ApplicationRecord
  validates_presence_of :name, :room_number

  has_many :courses
  has_many :students, through: :courses
end