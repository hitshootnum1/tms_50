class CourseSubjectTask < ActiveRecord::Base
  has_many :user_tasks, dependent: :destroy
  has_many :user_subjects, through: :user_tasks, dependent: :destroy

  belongs_to :course_subject
  belongs_to :task

  delegate :name, to: :task, prefix: true

  def name_with_initial
    "#{task.name}"
  end
end
