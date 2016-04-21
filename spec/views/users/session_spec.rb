require "rails_helper"

RSpec.describe "users/sessions/new", type: :view do
  it{expect(controller.request.path_parameters[:action]).to eq("new")}
end
