User.create! name: "admin", email: "admin@admin.com", admin: true,
  password: "foobar", password_confirmation: "foobar", role: 1
User.create! name: "Vinh2", email: "vinh2@gmail.com", admin: true,
  password: "123456", password_confirmation: "123456", role: 1
User.create! name: "user", email: "user@user.com", admin: true, role: 0,
  password: "foobar", password_confirmation: "foobar"

10.times do |n|
  User.create! name: "user#{n+1}", email: "user#{n+1}@user.com", role: 0,
  password: "foobar", password_confirmation: "foobar"
end

Course.create! name: "Course-1", description: "Traning course"

5.times do |n|
  Subject.create! name: "Subject-#{n+1}", description: "Traning subject"
end

5.times do |n|
  Task.create! name: "Task-#{n+1}", subject_id: n+1
end

5.times do |n|
  CourseSubject.create! course_id: 1, subject_id: n+1
end

5.times do |n|
  UserSubject.create! user_id: 4, course_subject_id: n+1, status: "Started"
end

# 3.times do |n|
#   UserTask.create! user_subject_id: 1, course_subject_task_id: n+1
# end

# 3.times do |n|
#   UserTask.create! user_subject_id: 2, course_subject_task_id: n+1
# end

# 5.times do |n|
#   CourseSubjectTask.create! course_subject_id: 1, task_id: n+1
# end
# 5.times do |n|
#   CourseSubjectTask.create! course_subject_id: 2, task_id: n+1
# end

# 5.times do |n|
#   10.times do |m|
#     Task.create! subject_id: n+1,
#       name: "Task-#{m+1}",
#       content: Faker::Lorem.paragraphs(rand(2..8)),
#       modify: false
#   end
# end
