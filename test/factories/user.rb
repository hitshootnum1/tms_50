FactoryGirl.define do
  factory  :admin, aliases: [:supervisor], class: User do
    name "Admin"
    email "admin@admin.com"
    password "foobar"
    password_confirmation "foobar"
    role User.roles[:supervisor]
  end

  factory :user do
    password "foobar"
    password_confirmation "foobar"

    trait :trainee do
      name "user-default"
      email "user@user.com"
      role User.roles[:trainee]
    end
    trait :supervisor do
      role User.roles[:supervisor]
      name "admin"
      email "admin@admin.com"
    end
  end
end
