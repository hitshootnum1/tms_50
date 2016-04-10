class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @course = @user.user_courses.find_by(status: true).course
  end
end
