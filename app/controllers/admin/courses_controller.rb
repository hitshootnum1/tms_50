class Admin::CoursesController < ApplicationController
  before_action :load_all_courses, only: [:create, :destroy, :index]
  before_action :load_new_course, only: [:create, :destroy, :index]
  before_action :load_all_subjects, only: [:create, :destroy, :index]

  def index
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "courses.create_success"
      redirect_to :back
    else
      flash.now[:danger] = t "courses.create_error"
      render :index
    end
  end

  def destroy
    course = Course.find_by id: params[:id]
    if course.destroy
      flash[:success] = t "courses.delete_success"
      redirect_to :back
    else
      flash.now[:danger] = t "courses.delete_error"
      render :index
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :description,
      course_subjects_attributes: [:id, :subject_id, :_destroy]
  end

  def load_all_courses
    @courses = Course.all.page params[:page]
  end

  def load_new_course
    @course = Course.new
  end

  def load_all_subjects
    @subjects = Subject.all
  end
end
