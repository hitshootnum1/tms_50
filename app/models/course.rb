class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :course_subjects, dependent: :destroy
  has_many :course_subject_tasks, through: :course_subjects

  belongs_to :user

  accepts_nested_attributes_for :course_subjects,
    reject_if: proc {|attributes| attributes[:subject_id].blank?},
    allow_destroy: true
  accepts_nested_attributes_for :user_courses, allow_destroy: true

  validates :name, presence: true
end
