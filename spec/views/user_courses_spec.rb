require "rails_helper"

describe "user_courses/index", type: :view do
  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("index")
  end
end
