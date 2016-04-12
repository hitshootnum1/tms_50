class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  delegate :name, :start_course, to: :user, prefix: true
end
