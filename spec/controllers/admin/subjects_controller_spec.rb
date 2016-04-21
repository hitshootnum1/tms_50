require "rails_helper"

RSpec.describe Admin::SubjectsController, type: :controller do

  let(:user) {FactoryGirl.create :admin}
  let(:subject) {FactoryGirl.create :subject}

  before do
    sign_in user
    request.env["HTTP_REFERER"] = admin_subjects_path
  end

  describe "GET #create" do
    it "create subject test" do
      get :create, ActionController::Parameters.
        new(subject: {name: Faker::Lorem.word})
    end

    it "create subject fail test" do
      get :create, ActionController::Parameters.
        new(subject: {name: ""})
    end
  end

  describe "PATCH #update" do
    it "update subject test" do
      patch :update, id: subject, subject: ActionController::Parameters.
        new(name: Faker::Lorem.word)
    end

    it "update subject fail test" do
      patch :update, id: subject, subject: ActionController::Parameters.
        new(name: "")
    end
  end

  describe "DELETE #destroy" do
    it "destroy subject test" do
      delete :destroy, id: subject
    end
  end
end
