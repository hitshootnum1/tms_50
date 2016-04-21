require "rails_helper"

RSpec.describe UserSubject, type: :model do

  it "user subject find by course test" do
    user_subjects = UserSubject.all
    course = FactoryGirl.create :course
    UserSubject.find_by_course user_subjects, course
  end
end
