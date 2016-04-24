FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Job #{n}" }
    salary { "R$ #{Faker::Commerce.price}" }
    location { Faker::Address.city }
    description Faker::Lorem.paragraph(4)
    how_to_apply Faker::Lorem.paragraph(1)
    job_type
    category
    company
    author { Faker::Name.name }
    author_email { Faker::Internet.email }
  end
end
