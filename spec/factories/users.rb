FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"
  end

  factory :admin, class: User do
    name Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password(8)
    admin true
  end
end
