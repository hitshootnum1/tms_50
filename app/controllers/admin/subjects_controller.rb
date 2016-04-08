class Admin::SubjectsController < ApplicationController
  before_action :load_all_subjects, only: [:index, :create, :destroy]
  before_action :load_subject, except: [:new, :edit, :show]

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

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "subjects.update_success"
      redirect_to :back
    else
      flash.now[:danger] = t "subjects.update_error"
      render :index
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "subjects.delete_success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "subjects.delete_error"
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
    if params[:id].nil?
      @subject = Subject.new
    else
      @subject = Subject.find_by(id: params[:id])
    end
  end
end
