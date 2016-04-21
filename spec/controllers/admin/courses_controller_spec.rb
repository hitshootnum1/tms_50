require "rails_helper"

describe Admin::CoursesController, type: :controller do
  let(:user) {FactoryGirl.create :admin}
  let(:course) {FactoryGirl.create :course}
  let(:user_course) {FactoryGirl.create :user_course, course_id: 1}
  subject{{user: user, course: course, user_course: user_course}}

  before(:each) do
    sign_in subject[:user]
    request.env["HTTP_REFERER"] = admin_courses_path
  end

  it "show course test" do
    get :show, id: subject[:course]
  end

  it "index courses test" do
    get :index, id: subject[:course]
  end

  it "update courses success test" do
    course_params = ActionController::Parameters.
      new(course: {status: :finished})
    patch :update, id: subject[:course], course: course_params
  end

  it "update courses fail test" do
    course_params = ActionController::Parameters.
      new(course: {status: 0})
    patch :update, id: subject[:course], course: course_params
  end

  it "destroy course success test" do
    delete :destroy, id: subject[:course]
  end

  it "create course fail test" do
    course_params = ActionController::Parameters.
      new(course: {status: :finished})
    post :create, course: course_params
  end

  it "create course success test" do
    course_params = FactoryGirl.attributes_for(:course)
    course_params[:status] = :finished
    post :create, course: course_params
  end
end
