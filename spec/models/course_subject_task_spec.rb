require "rails_helper"

describe CourseSubjectTask, type: :model do
  let(:task) {FactoryGirl.create :task}
  let(:course_subject_task) {FactoryGirl.create :course_subject_task, task_id: task.id}

  subject{course_subject_task}
  describe "#name_with_initial" do
    it {expect(subject.name_with_initial).to eq course_subject_task.task_name}
  end
end
