class CreateSampleJobsService
  def call(count=10)
    (0..count).each do
      Job.create(
        title: Faker::Name.title,
        company_id: Company.all.sample(1).first.id,
        description: Faker::Lorem.paragraph(5),
        status: 'published',
        category_id: Category.all.sample(1).first.id,
        job_type_id: JobType.all.sample(1).first.id,
        author: Faker::Name.first_name,
        author_email: Faker::Internet.email
      )
    end
  end
end
