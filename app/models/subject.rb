class Subject < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :courses, through: :course_subjects, dependent: :destroy
end
