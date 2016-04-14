FactoryGirl.define do
  factory :course do
    description {Faker::Lorem.sentence}
    start_date {Time.now - 30.days}
    end_date {Time.now}
    status 0
  end
end
