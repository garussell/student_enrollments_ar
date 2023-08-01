require 'rails_helper' 

RSpec.describe "teachers index page", type: :feature do
  before(:each) do
    # Students
    @larry = Student.create!(name: "Larry")
    @curley = Student.create!(name: "Curley")
    @moe = Student.create!(name: "Moe")
    # Teachers
    @math_teacher = Teacher.create!(name: "Mathy", room_number: 4)
    @science_teacher = Teacher.create!(name: "Sciency", room_number: 3)
    @reading_teacher = Teacher.create!(name: "Ready", room_number: 9)
    # Courses
    @math = Course.create!(name: "Math", teacher_id: @math_teacher.id)
    @science = Course.create!(name: "Science", teacher_id: @science_teacher.id)
    @reading = Course.create!(name: "Reading", teacher_id: @reading_teacher.id)
    # Sign em' up
    Enrollment.create!(student: @larry, course: @math, grade: 2)
    Enrollment.create!(student: @larry, course: @science, grade: 4)
    Enrollment.create!(student: @larry, course: @reading, grade: 6)
    Enrollment.create!(student: @curley, course: @math, grade:3)
    Enrollment.create!(student: @curley, course: @reading, grade: 4)
    Enrollment.create!(student: @moe, course: @math, grade: 1)
    Enrollment.create!(student: @moe, course: @science, grade: 7)
  end

  describe "as a user" do
    describe "when I visit the teachers index page (/teacher)" do
      it "i see a list of all teachers and their room number" do
        visit teachers_path
    
        expect(page).to have_content(@math_teacher.name)
        expect(page).to have_content(@science_teacher.name)
        expect(page).to have_content(@reading_teacher.name)
      end

      it "and underneath each teacher's name I see a list of the students that are enrolled in their classes,and each student's name is a link to their specific show page" do
        visit teachers_path

        @math_teacher.students.each do |student|
          expect(page).to have_link(student.name)
        end
        @science_teacher.students.each do |student|
          expect(page).to have_link(student.name)
        end
        @reading_teacher.students.each do |student|
          expect(page).to have_link(student.name)
        end
      end
    end
  end
end