class CourseSubject < ActiveRecord::Base
  has_many :course_subject_tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy

  belongs_to :course
  belongs_to :subject

  delegate :name, :description, to: :subject, prefix: true
end
