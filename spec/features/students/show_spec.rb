require 'rails_helper' 

RSpec.describe "students show page", type: :feature do
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

  # 1. Student Show Page
  describe "as a user" do
    describe "when I visit a student show page (/student/:id)" do
      it "I see the name of the student and I see the names of all courses that this student is enrolled in," do
        visit student_path(@larry)

        expect(page).to have_content(@larry.name)
        @larry.enrollments.each do |enrollment|
          expect(page).to have_content(enrollment.course.name)
        end
      end
      
      it "as well as a numeric count of the number of courses the student is currently enrolled in," do
        visit student_path(@larry)
        
        expect(page).to have_content(@larry.enrollments.count)
      end

      it "and I see the average grade across all classes that this student is enrolled in" do
        visit student_path(@larry)

        expect(page).to have_content(@larry.average_grade)
      end
    end
  end
end