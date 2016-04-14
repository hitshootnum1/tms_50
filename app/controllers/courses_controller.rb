class CoursesController < ApplicationController

  load_and_authorize_resource

  def show
    @activities = PublicActivity::Activity.all
  end
end
