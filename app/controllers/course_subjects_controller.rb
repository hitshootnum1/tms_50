class CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def show
    @user_subject = UserSubject.find_by user: current_user,
      course_subject: @course_subject
    @tasks = @course_subject.course_subject_tasks.map &:task
    @finished_tasks = @user_subject.course_subject_tasks.map &:task
  end
end
