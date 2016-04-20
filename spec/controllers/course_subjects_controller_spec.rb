require "rails_helper"

RSpec.describe CourseSubjectsController, type: :controller do
  before do
    @user = FactoryGirl.create :admin
    @course_subject = FactoryGirl.create :course_subject
    @user_subject = FactoryGirl.create :user_subject
  end

  it "show course subject test" do
    sign_in @user
    get :show, id: @course_subject
  end
end
