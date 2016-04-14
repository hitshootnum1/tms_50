class UserSubject < ActiveRecord::Base
  include PublicActivity::Model

  has_many :user_tasks, dependent: :destroy
  has_many :course_subject_tasks, through: :user_tasks, dependent: :destroy

  belongs_to :user
  belongs_to :course_subject

  has_one :course, through: :course_subject

  accepts_nested_attributes_for :user_tasks, allow_destroy: true

  enum status: [:ready, :started, :finished]

  class << self
    def find_by_course user_subjects, course
      user_subjects.select{|user_subject| user_subject.course == course}
    end
  end
end
