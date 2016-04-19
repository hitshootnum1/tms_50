FactoryGirl.define do
  factory :subject do
    name {Faker::Lorem.word}
    description {Faker::Lorem.sentences}
  end
end
