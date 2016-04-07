class UserTask < ActiveRecord::Base
  belongs_to :user_subject
  belongs_to :course_subject_task
end
