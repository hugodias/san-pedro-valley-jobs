FactoryGirl.define do
  factory :company do
    sequence(:title) { |n| "Startup #{n}" }
    website { Faker::Internet.url }
    email { Faker::Internet.email }
    logo nil
  end
end
