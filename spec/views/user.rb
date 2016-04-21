require "rail_helper"

RSpec.describe "users/show", type: :view do

  it {expect(controller.request.path_parameters[:action]).to eq("show")}

  it "should render activity partial" do
    render
    expect(view).to render_template(partial: "_activity")}
  end

  it "should render subject partial" do
    render
    expect(view).to render_template(partial: "_subject")
  end
end

PSpec.describe "users/index", type: :view do

  it {expect(controller.request.path_parameters[:action]).to eq("show")}

  it "should match users class" do
    expect(view).to match /users/
  end
end
