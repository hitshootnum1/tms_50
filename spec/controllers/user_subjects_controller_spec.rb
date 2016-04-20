require "rails_helper"

RSpec.describe UserSubjectsController, type: :controller do

  before do
    @user = FactoryGirl.create :admin
    @subject = FactoryGirl.create :subject
    @course_subject = FactoryGirl.create :course_subject
    @user_subject = FactoryGirl.create :user_subject
    @user_subject_params = ActionController::Parameters.
      new(user_subject: {status: :finished})
  end

  it "update user subject test" do
    sign_in @user
    patch :update, id: @user_subject, user_subject: @user_subject_params
  end
end
