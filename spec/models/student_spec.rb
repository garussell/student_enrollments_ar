require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    # Studenets
    @larry = Student.create!(name: "Larry")
    # Teachers
    @math_teacher = Teacher.create!(name: "Mathy", room_number: 4)
    @science_teacher = Teacher.create!(name: "Sciency", room_number: 3)
    @reading_teacher = Teacher.create!(name: "Ready", room_number: 9)
    # Courses
    @math = Course.create!(name: "Math", teacher_id: @math_teacher.id)
    @science = Course.create!(name: "Science", teacher_id: @science_teacher.id)
    @reading = Course.create!(name: "Reading", teacher_id: @reading_teacher.id)
    
    Enrollment.create!(student: @larry, course: @math, grade: 2)
    Enrollment.create!(student: @larry, course: @science, grade: 4)
    Enrollment.create!(student: @larry, course: @reading, grade: 6)
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_many(:enrollments) }
    it { should have_many(:courses).through(:enrollments) }
    it { should have_many(:teachers).through(:courses) }
  end

  describe "#instance_methods" do
    describe "#number_of_enrollments" do
      it "can return the number of course a student is enrolled in" do
        expect(@larry.number_of_enrollments).to eq(3)
      end
    end

    describe "#average_grade" do
      it "can return the average grade of all enrolled classes" do
        expect(@larry.average_grade).to eq(4)
      end
    end
  end
end