FactoryGirl.define do
  factory :course do
    name {Faker::Lorem.word}
    description {Faker::Lorem.sentence}
    user_id 1
    start_date {Time.now - 30.days}
    end_date {Time.now}
    status 0
  end
end
