require "rails_helper"

describe "courses/show", type: :view do
  let(:course) {FactoryGirl.create :course}
  let(:activities) {PublicActivity::Activity.all}
  let(:members) {User.all}

  before do
    assign :course, course
    assign :activities, activities
    assign :members, members
  end

  it "render _course_activity" do
    render
    expect(view).to render_template(partial: "_course_activity")
  end

  it "render _course_member" do
    render
    expect(view).to render_template(partial: "_course_member")
  end

  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("show")
  end
end
