class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @activities = PublicActivity::Activity.all
    @course = Course.find_active_course @user.courses
  end
end
