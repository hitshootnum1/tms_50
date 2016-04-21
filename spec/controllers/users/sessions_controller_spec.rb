require "rails_helper"
require "users/sessions_controller"

RSpec.describe Users::SessionsController, type: :controller do
  before {@request.env["devise.mapping"] = Devise.mappings[:user]}

  describe "GET #new" do
    let(:guest) {FactoryGirl.build :guest}
    subject{guest}

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
    end

    it "create guest user" do
      get :new
      expect(assigns :user).to be_the_same_guest subject
    end
  end

  describe "POST #create" do
    context "vaild user" do
      sign_in_user

      it {expect(response).to redirect_to user_path subject.current_user}
    end

    context "invalid user" do
      sign_in_user :invalid, :password

      it {expect(response).to render_template :new}
    end
  end

  describe "DELETE #destroy" do
    sign_in_user
    sign_out_user

    it {expect(subject.current_user).to eq nil}
  end
end
