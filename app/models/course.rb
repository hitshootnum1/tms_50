class Course < ActiveRecord::Base

  before_update :init_user_subjects
  after_update :load_user_subjects

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

  enum status: [:ready, :started, :finished]

  after_create :send_email_notify_course_finish

  def load_user_subjects
    if self.started?
      add_user_subjects
      remove_user_subjects
      user_start_course
    end
  end

  def init_user_subjects
    unless self.started?
      self.course_subjects.each do |course_subject|
        self.users.each do |user|
          user_subject = user.user_subjects.
            create course_subject_id: course_subject.id
        end
      end
    end
  end

  def add_user_subjects
    self.user_courses.each do |user_course|
      self.course_subjects.each do |course_subject|
        unless user_course.user_start_course
          UserSubject.create user_id: user_course.user_id,
            course_subject_id: course_subject.id
        end
      end
    end
  end

  def remove_user_subjects
    user_courses = self.user_courses.map &:user_id
    self.course_subjects.each do |course_subject|
      course_subject.users.each do |user|
        unless user_courses.include? user.id
          UserSubject.destroy_all user_id: user.id
          user.update_attributes start_course: false
        end
      end
    end
  end

  def user_start_course
    self.users.each do |user|
      user.update_attributes start_course: true unless user.start_course
    end

  private
  def send_email_notify_course_finish
    SupervisorMailer.delay(
      run_at: Proc.new{self.end_date - 2.days}).notify_course_finish_in_two_days(self)
  end
end
