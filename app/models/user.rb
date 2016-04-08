class User < ActiveRecord::Base

  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :course_subjects, through: :user_subjects, dependent: :destroy

  belongs_to :role

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save :assign_role

  def supervisor?
    self.role.name == "supervisor"
  end

  def trainee?
    self.role.name == "trainee"
  end

  private
  def assign_role
    if self.role.name == Role.find_by(name: "guest")
      self.role = Role.find_by name: "trainee"
    end
  end
end
