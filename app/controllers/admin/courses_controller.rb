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
    @course.user = current_user
    if @course.save
      create_activity
      flash[:success] = t "courses.create_success"
      redirect_to :back
    else
      flash.now[:danger] = t "courses.create_error"
      render :index
    end
  end

  def update
    @old_status = @course.status
    @old_user_ids = []
    @course.user_courses.each do |user_course|
      @old_user_ids.push user_course.user_id
    end
    if @course.update_attributes course_params
      create_activity
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
    params.require(:course).permit :name, :description, :status,
      subject_ids: [], user_ids: []
  end

  def load_all_subjects
    @subjects = Subject.all
  end

  def create_activity
    if @old_status != @course.status
      @course.create_activity :update_course, owner: current_user,
        content: t("courses.status", status: @course.status),
        target: @course.name, target_id: @course.id
    else
      if params[:course][:user_ids]
        @new_user_ids = params[:course][:user_ids].map(&:to_i)
        (@old_user_ids + @new_user_ids).uniq.each do |user_id|
          content = if @old_user_ids.include?(user_id) && @new_user_ids.exclude?(user_id)
            t("courses.removed")
          elsif @old_user_ids.exclude?(user_id) && @new_user_ids.include?(user_id)
            t("courses.joined")
          else
            nil
          end
          if content && user = User.find_by(id: user_id)
            @course.create_activity :joined, owner: user,
              content: content,
              target: @course.name, target_id: @course.id
          end
        end
      end
    end
  end
end
