class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    if @user_subject.update_attributes user_subject_params
      create_activity
      flash[:success] = params[:update] ? t("user_tasks.update_success") :
        t("subjects.finish_success")
    else
      flash[:warning] = params[:update] ? t("user_tasks.all_tasks_closed") :
        t("subjects.finish_error")
    end
    respond_to do |format|
      format.html {redirect_to course_path @user_subject.course_subject}
      format.js
    end
  end

  private
  def user_subject_params
    params.require(:user_subject).permit :user_id, :course_subject_id,
      :status, course_subject_task_ids: []
  end

  def create_activity
    content = params[:update] ? t("subjects.updated_subject") :
      t("subjects.finished_subject")
    @user_subject.create_activity :finish, owner: current_user,
        content: content,
        target: @user_subject.course_subject.subject_name
  end
end
