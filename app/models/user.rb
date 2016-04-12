class User < ActiveRecord::Base

  enum role: [:trainee, :supervisor]

  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :course_subjects, through: :user_subjects, dependent: :destroy
  has_many :created_courses, class_name: Course
  has_many :user_tasks, through: :user_subjects

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save :add_default_role

  private
  def add_default_role
    self.role.trainee! if self.role.nil?
  end
end
