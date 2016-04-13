require "factory_girl_rails"

admin = FactoryGirl.create :admin

10.times do |n|
  FactoryGirl.create :user, :trainee, name: "user#{n+1}", email: "user#{n+1}@user.com"
end

FactoryGirl.create :course, name: "Course-1", description: "Traning course", user_id: 1

5.times do |n|
  FactoryGirl.create :subject, name: "Subject-#{n+1}", description: "Traning subject"
end

5.times do |n|
  FactoryGirl.create :task, name: "Task-#{n+1}", subject_id: n+1
end

5.times do |n|
  FactoryGirl.create :course_subject, course_id: 1, subject_id: n+1
end

FactoryGirl.create :user_course, course_id: 1, user_id: 4

5.times do |n|
  FactoryGirl.create :user_subject, user_id: 4, course_subject_id: n+1
end

5.times do |n|
  FactoryGirl.create :course_subject_task, course_subject_id: 1, task_id: n+1
end

3.times do |n|
  FactoryGirl.create :user_task, user_subject_id: 1, course_subject_task_id: n+1
end
