FactoryGirl.define do
  factory :company do
    title Faker::Company.name
    website Faker::Internet.url
    email Faker::Internet.email
    logo nil
  end
end
