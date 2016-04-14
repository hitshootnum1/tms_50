FactoryGirl.define do
  factory  :admin, aliases: [:supervisor], class: User do
    name "Admin"
    email "admin@admin.com"
    password "foobar"
    password_confirmation "foobar"
    role 1
  end

  factory :user do
    password "foobar"
    password_confirmation "foobar"

    trait :trainee do
      name "user-default"
      email "user@user.com"
      role 0
    end
    trait :supervisor do
      role 1
      name "admin"
      email "admin@admin.com"
    end
  end
end
