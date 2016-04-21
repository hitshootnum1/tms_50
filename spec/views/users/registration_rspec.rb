require "rails_helper"

RSpec.describe "users/registrations/new", type: :view do
  it{expect(controller.request.path_parameters[:action]).to eq("new")}
end


RSpec.describe "users/registrations/edit", type: :view do
  it{expect(controller.request.path_parameters[:action]).to eq("edit")}
end

