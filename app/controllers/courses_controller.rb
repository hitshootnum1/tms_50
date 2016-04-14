class CoursesController < ApplicationController

  load_and_authorize_resource

  def show
    @activities = PublicActivity::Activity.all
    @members = []
    @course.user_courses.each do |user_course|
      @members.push user_course.user if user_course.user
    end
  end
end
