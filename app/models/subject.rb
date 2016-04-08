class Subject < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :courses, through: :course_subjects, dependent: :destroy

  accepts_nested_attributes_for :tasks,
    reject_if: proc {|attributes| attributes[:name].blank?},
    allow_destroy: true

  validates :name, presence: true
end
