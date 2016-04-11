class UserSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :user_subject_params, only: :update

  def update
    if @user_subject.update_attributes user_subject_params
      flash[:success] = t "subjects.finish_success"
    else
      flash[:warning] = t "subjects.finish_error"
    end
    redirect_to course_subject_path(@user_subject.course_subject)
  end

  private
  def user_subject_params
    params.require(:user_subject).permit :user_id, :course_subject_id, :status
  end
end
