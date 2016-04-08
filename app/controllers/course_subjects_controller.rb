class CourseSubjectsController < ApplicationController
  before_action :find_course_subject, only: :show

  def show
    @user_subject = UserSubject.find_by user: current_user,
      course_subject: @course_subject
    @tasks = @course_subject.course_subject_tasks.map &:task
    @finished_tasks = @user_subject.course_subject_tasks.map &:task
  end

  private
  def find_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
  end
end
