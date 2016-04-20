require "rails_helper"

describe "course_subjects/show", type: :view do
  let(:course_subject) {FactoryGirl.create :course_subject}
  let(:user_subject) {FactoryGirl.create :user_subject}
  let(:course_subject_tasks) {CourseSubjectTask.all}
  let(:subject) {FactoryGirl.create :subject}
  let(:users) {User.all}

  before do
    assign :course_subject, course_subject
    assign :subject, subject
    assign :user_subject, user_subject
    assign :course_subject_tasks, course_subject_tasks
    assign :users, users
  end

  it "render _update_tasks test" do
    render
    expect(view).to render_template(partial: "_update_tasks")
  end

  it "parameter action test" do
    expect(controller.request.path_parameters[:action]).to eq("show")
  end
end
