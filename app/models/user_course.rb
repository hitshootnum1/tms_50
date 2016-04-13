class UserCourse < ActiveRecord::Base
  after_create :send_email_when_assigned
  after_destroy :send_email_when_removed

  belongs_to :user
  belongs_to :course

  delegate :name, :start_course, to: :user, prefix: true

  private
  def send_email_when_assigned
    TraineeWorker.perform_async TraineeWorker::ASSIGN_TRAINEE, self.user_id, self.course_id
  end

  def send_email_when_removed
    TraineeWorker.perform_async TraineeWorker::REMOVE_TRAINEE, self.user_id, self.course_id
  end
end
