class Admin::CourseSubjectsController < ApplicationController

  load_and_authorize_resource

  def update
    if @course_subject.update_attributes course_subject_params
      create_activity
      flash[:success] = t "course_subject.started"
    else
      flash[:warning] = t "course_subject.start_error"
    end
    respond_to do |format|
      format.html {redirect_to admin_course_path(@course_subject.course)}
      format.js
    end
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :id, :course_id, :subject_id,
      :status, task_ids: []
  end

  def create_activity
    @course_subject.create_activity :start_subject, owner: current_user,
      content: t("subjects.start"),
      target: @course_subject.subject_name
  end
end
