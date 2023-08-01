class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @enrollments = @student.enrollments
  end
end