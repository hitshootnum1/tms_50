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
      name "user#{User.count}"
      email "user#{User.count}@user.com"
      role User.roles[:trainee]
    end

    trait :default_trainee do
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

  factory :guest, class: User do
  end

  factory :sign_in_user, class: User do
    email "user@user.com"
    password "foobar"
  end
end
