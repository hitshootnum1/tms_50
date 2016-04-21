require "rails_helper"

describe Course, type: :model do
  let(:user) {FactoryGirl.create :user, :trainee}
  let(:course) {FactoryGirl.create :course, user_id: user.id}
  subject {course}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is not valid" do
      before {subject.name = nil}
      it {is_expected.to have(1).error_on :name}
    end
  end

  it "reject if subject_id blank" do
    course_subjects = Course.nested_attributes_options[:course_subjects]
    expect(course_subjects[:reject_if].call({subject_id: ""})).to be true
  end

  describe "#load_user_subjects" do
    before do
      course.update_attributes status: 1
      course_subject_sample = FactoryGirl.create :course_subject,
        course_id: subject.id, subject_id: 1
      user_sample = FactoryGirl.create :user, :supervisor
      FactoryGirl.create :user_course,
        course_id: subject.id, user_id: user.id
      FactoryGirl.create :user_subject,
        course_subject_id: course_subject_sample.id, user_id: user.id
      FactoryGirl.create :user_subject,
        course_subject_id: course_subject_sample.id, user_id: user_sample.id
      subject.load_user_subjects
    end
    it {expect(UserSubject.count).to eq 2}
  end

  describe "#init_user_subjects" do
    before do
      subject_sample = FactoryGirl.create :subject
      FactoryGirl.create :course_subject, course_id: subject.id,
        subject_id: subject_sample.id
      FactoryGirl.create :user_course, course_id: subject.id, user_id: user.id
      subject.init_user_subjects
    end
    it {expect(UserSubject.count).to eq 1}
  end

  describe "#add_user_subjects" do
    before do
      FactoryGirl.create :course_subject, course_id: subject.id, subject_id: 1
      FactoryGirl.create :user_course, course_id: subject.id, user_id: user.id
      subject.add_user_subjects
    end
    it {expect(UserSubject.count).to eq 1}
  end

  describe "#remove_user_subjects" do
    before do
      course_subject_sample = FactoryGirl.create :course_subject,
        course_id: subject.id, subject_id: 1
      user_sample = FactoryGirl.create :user, :supervisor
      FactoryGirl.create :user_course,
        course_id: subject.id, user_id: user.id
      FactoryGirl.create :user_subject,
        course_subject_id: course_subject_sample.id, user_id: user.id
      FactoryGirl.create :user_subject,
        course_subject_id: course_subject_sample.id, user_id: user_sample.id
      subject.remove_user_subjects
    end
    it {expect(UserSubject.count).to eq 1}
  end

  describe "#user_start_course" do
    before do
      FactoryGirl.create :user_course, course_id: subject.id, user_id: user.id
      subject.user_start_course
    end
    it {expect(subject.users.first.start_course).to be_truthy}
  end

  describe ".find_active_course" do
    before do
      FactoryGirl.create :user_course, course_id: subject.id, user_id: user.id
      Course.find_active_course user.courses
    end
    it {expect(subject).to eq course}
  end

  describe "call_back" do
    context "when before update course" do
      it {is_expected.to callback(:init_user_subjects).before :update}
    end

    context "when after update course" do
      it {is_expected.to callback(:load_user_subjects).after :update}
    end

    context "when after create course" do
      it {is_expected.to callback(:send_email_notify_course_finish).after :create}
    end
  end
end
