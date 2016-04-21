require "rails_helper"

RSpec.describe User, type: :model do

  context "default trainee user" do
    let(:user) {
      User.find_by email: FactoryGirl.attributes_for(:user, :default_trainee)[:email]}
    subject{user}
    describe "#name" do
      it {expect(subject.name).to_not be_nil}
      it {expect(subject.name).to eq "user-default"}
    end

    describe "#email" do
      it {expect(subject.email).to_not be_nil}
      it {expect(subject.email).to eq "user@user.com"}
    end

    describe "#roles" do
      it {expect(User.roles[subject.role]).to eq User.roles[:trainee]}
    end
  end

  context "supervisor user" do
    let(:admin) {FactoryGirl.create :supervisor}
    subject{admin}
    describe "#roles" do
      it {expect(User.roles[subject.role]).to eq User.roles[:supervisor]}
    end
  end

  describe "#add_default_role" do
    let(:user) {FactoryGirl.create :user, :trainee, role: User.roles[:guest]}
    subject{user}
    it {expect(User.roles[subject.role]).to eq User.roles[:trainee]}
  end

  describe "#is?" do
    let(:user) {User.find_by id: 1}
    let(:same_user) {User.find_by id: 1}
    let(:different_user) {User.find_by id: 3}
    subject{{user: user, same_user: same_user, different_user: different_user}}

    it {expect(subject[:user].is? subject[:same_user]).to eq true}
    it {expect(subject[:user].is? subject[:different_user]).to eq false}
  end
end
