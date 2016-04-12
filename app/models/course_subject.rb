class CourseSubject < ActiveRecord::Base
  has_many :course_subject_tasks, dependent: :destroy
  has_many :cs_tasks, class_name: CourseSubjectTask.to_s
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy

  belongs_to :course
  belongs_to :subject

  delegate :name, :description, to: :subject, prefix: true
  delegate :name, :description, to: :course, prefix: true

  accepts_nested_attributes_for :course_subject_tasks, allow_destroy: true
end
