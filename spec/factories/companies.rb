FactoryGirl.define do
  factory :company do
    sequence(:title) { |n| "Startup #{n}" }
    website { Faker::Internet.url }
    email { Faker::Internet.email }
    logo nil

    factory :company_with_jobs do
      transient do
        jobs_count 5
      end

      after(:create) do |company, evaluator|
        create_list(:job, evaluator.jobs_count, company: company)
      end
    end
  end
end
