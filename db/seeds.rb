User.create! name: "Admin",
  email: "admin@admin.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true

10.times do |n|
  User.create! name: "User #{n}",
  email: "user#{n}@user.com",
  password: "foobar",
  password_confirmation: "foobar"
end

2.times do |n|
  Course.create! name: "Training-#{n+1}", description: "Traning course"
end

UserCourse.create! user_id: 1, course_id: 1, status: true

10.times do |n|
  Subject.create! name: "Subject-#{n+1}"
end

10.times do |n|
  Task.create! subject_id: 1, name: "Task-#{n+1}", modify: false
end

5.times do |n|
  CourseSubject.create! course_id: 1, subject_id: n+1
  UserSubject.create! user_id: 1, course_subject_id: n+1, status: true
end

10.times do |n|
  CourseSubjectTask.create! course_subject_id: 1, task_id: n+1
  UserTask.create! user_subject_id: 1, course_subject_task_id: n+1, status: true
end
