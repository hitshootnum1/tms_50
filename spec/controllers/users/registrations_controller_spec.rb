require "rails_helper"
require "users/registrations_controller"

RSpec.describe Users::RegistrationsController, type: :controller do
  before {@request.env["devise.mapping"] = Devise.mappings[:user]}

  describe "GET #new" do
    let(:guest) {FactoryGirl.build :guest}
    subject{guest}
    before do
      get :new
    end
    it {expect(response).to be_success}
    it {expect(assigns(:user)).to be_the_same_guest guest}
  end

  describe "POST #create" do
    context "vaild attributes" do
      sign_up_user
      it {expect(response).to redirect_to user_path(subject.current_user)}
    end

    context "invalid attributes" do
      sign_up_user :invalid, :password
      it {expect(response).to render_template :new}
    end
  end
end
