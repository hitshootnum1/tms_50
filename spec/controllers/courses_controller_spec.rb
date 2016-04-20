require "rails_helper"

RSpec.describe CoursesController, type: :controller do
  before do
    @course = FactoryGirl.create :course
    @user_course = FactoryGirl.create :user_course, course_id: 1
    @user = FactoryGirl.create :admin
  end

  it "show course test" do
    sign_in @user
    get :show, id: @course
  end
end
