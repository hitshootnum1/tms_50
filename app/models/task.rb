class Task < ActiveRecord::Base
  has_many :course_subject_tasks, dependent: :destroy
  has_many :course_subject, through: :course_subject_tasks, dependent: :destroy

  belongs_to :subject
end
