FactoryGirl.define do
  factory :activity do
    key "update"
    content {Faker::Lorem.sentences}
    target "Course-1"
    target_id 1
  end
end
