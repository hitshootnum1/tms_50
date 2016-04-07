# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! name: "Vinh", email: "vinh@gmail.com", admin: true,
  password: "123456", password_confirmation: "123456"
5.times do |n|
  Course.create! name: "Training-#{n+1}", description: "Traning course"
end
3.times do |n|
  UserCourse.create! user_id: 1, course_id: n+1, status: false
end
5.times do |n|
  Subject.create! name: "Subject-#{n+1}"
end
5.times do |n|
  CourseSubject.create! course_id: 1, subject_id: n+1
end
