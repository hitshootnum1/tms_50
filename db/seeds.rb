Role.create! name: "guest"
Role.create! name: "supervisor"
Role.create! name: "trainee"

User.create! name: "Admin",
  email: "admin@admin.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  role: Role.find_by(name: "supervisor")

10.times do |n|
  User.create! name: "User #{n}",
  email: "user#{n}@user.com",
  password: "foobar",
  password_confirmation: "foobar",
  role: Role.find_by(name: "trainee")
end

5.times do |n|
  Subject.create! name: "Subject-#{n+1}", description: "Traning subject"
end

5.times do |n|
  Task.create! name: "Task-#{n+1}"
end

5.times do |n|
  CourseSubject.create! course_id: 1, subject_id: n+1
end
5.times do |n|
  CourseSubject.create! course_id: 2, subject_id: n+1
end
5.times do |n|
  CourseSubject.create! course_id: 3, subject_id: n+1
end
5.times do |n|
  CourseSubject.create! course_id: 4, subject_id: n+1
end
5.times do |n|
  CourseSubject.create! course_id: 5, subject_id: n+1
end

5.times do |n|
  UserSubject.create! user_id: 1, course_subject_id: n+1
end
5.times do |n|
  UserSubject.create! user_id: 2, course_subject_id: n+1
end

3.times do |n|
  UserTask.create! user_subject_id: 1, course_subject_task_id: n+1
end
3.times do |n|
  UserTask.create! user_subject_id: 2, course_subject_task_id: n+1
end

5.times do |n|
  CourseSubjectTask.create! course_subject_id: 1, task_id: n+1
end
5.times do |n|
  CourseSubjectTask.create! course_subject_id: 2, task_id: n+1
end

5.times do |n|
  10.times do |m|
    Task.create! subject_id: n+1,
      name: "Task-#{m+1}",
      content: Faker::Lorem.paragraphs(rand(2..8)),
      modify: false
  end
end
