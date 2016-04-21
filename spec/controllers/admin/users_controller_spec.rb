require "rails_helper"
require "admin/users_controller"

describe Admin::UsersController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:user) {FactoryGirl.create :user, :trainee}
  let(:user_subject) {FactoryGirl.create :user_subject}
  subject{{admin: admin, user: user, user_subject: user_subject}}

  before(:each) do
    sign_in subject[:admin]
    request.env["HTTP_REFERER"] = admin_users_path
  end

  it "index users test" do
    get :index, id: subject[:user]
  end

  describe "PATCH #update" do
    it "update user success test" do
      user_params = ActionController::Parameters.
        new(admin: {status: :finished})
      patch :update, id: subject[:admin], user: user_params
    end

    it "update user fail test" do
      user_params = FactoryGirl.attributes_for :user, :trainee, role: "trainee"
      patch :update, id: subject[:admin], user: user_params
    end

    it "edit action test" do
      get :edit, id: subject[:user]
      expect(subject[:user]).to eq user
    end
  end

  describe "POST #create" do
    it "create user success test" do
      user_params = {name: "test", email: "test@gmail.com", password: "123456",
        password_confirmation: "123456", role: "trainee"}
      post :create, user: user_params
    end

    it "create user fail test" do
      user_params = FactoryGirl.attributes_for :user, :trainee, role: "trainee"
      post :create, user: user_params
    end

    it "new action test" do
      get :new
      expect(subject[:user]).to eq user
    end
  end

  it "destroy user success test" do
    subject[:user_subject].create_activity :finish, owner: subject[:user],
      content: "content",
      target: "target"
    delete :destroy, id: subject[:user]
  end
end
