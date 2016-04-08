class UsersController < ApplicationController

  before_action :find_user, only: :show

  def show
    @course = @user.user_courses.find_by(status: true).course
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
  end
end
