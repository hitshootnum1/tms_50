class Admin::SubjectsController < ApplicationController
  before_action :load_all_subjects, only: [:index, :create]
  before_action :load_subject, only: [:index, :create]

  def index
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "subjects.create_success"
      redirect_to :back
    else
      flash.now[:danger] = t "subjects.create_error"
      render :index
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :modify, :_destroy]
  end

  def load_all_subjects
    @subjects = Subject.all.page params[:page]
  end

  def load_subject
    @subject = Subject.new
  end
end
