class Admin::CourseSubjectsController < ApplicationController

  load_and_authorize_resource

  def update
    if @course_subject.update_attributes course_subject_params
      flash[:success] = t "course_subject.updated"
    else
      flash[:warning] = t "course_subject.update_error"
    end
    respond_to do |format|
      format.html {redirect_to edit_admin_course_subject_path(@course_subject)}
      format.js
    end
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :id, :course_id, :subject_id,
      :status, task_ids: []
  end
end
