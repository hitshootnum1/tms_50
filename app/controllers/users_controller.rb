class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @activities = Activity.load_activities current_user, User.to_s
  end
end
