require "rails_helper"

RSpec.describe UsersController, type: :controller do

  let(:user) {User.find_by email: FactoryGirl.attributes_for(:user,
    :default_trainee)[:email]}
  subject{user}

  context "logged in user" do
    before do
      sign_in subject
    end

    describe "GET #show" do
      show_user

      it {expect(response).to render_template :show}
      it {expect(assigns :user).to eq subject}
    end
  end
end
