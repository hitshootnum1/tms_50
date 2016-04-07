class User < ActiveRecord::Base

  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :course_subjects, through: :user_subjects, dependent: :destroy

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
