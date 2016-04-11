class Admin::CoursesController < ApplicationController
  before_action :load_all_subjects, only: [:index, :edit]

  load_and_authorize_resource

  def index
    @courses = @courses.page params[:page]
    @course = Course.new
  end

  def show
    @users = User.page params[:page]
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

  def update
    if @course.update_attributes course_params
      flash[:success] = t "courses.update_success"
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = t "courses.update_error"
      render :index
    end
  end

  def destroy
    if @course.destroy
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
      subject_ids: [], user_ids: []
  end

  def load_all_subjects
    @subjects = Subject.all
  end
end
