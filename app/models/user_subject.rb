class UserSubject < ActiveRecord::Base
  has_many :user_tasks, dependent: :destroy
  has_many :course_subject_tasks, through: :user_tasks, dependent: :destroy

  belongs_to :user
  belongs_to :course_subject

  accepts_nested_attributes_for :user_tasks, allow_destroy: true

  def not_finish?
    self.status != "Finished"
  end
end
