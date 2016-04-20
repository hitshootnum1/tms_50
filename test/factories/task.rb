FactoryGirl.define do
  factory :task do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    modify false
  end
end
