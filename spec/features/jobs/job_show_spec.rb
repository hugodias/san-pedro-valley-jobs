# Feature: Job page
#   As a visitor
#   I want to visit a job page
#   So I can see it data
feature 'Job page', :devise do

  # Scenario: Visitor can see a published job
  #   Given I am a visitor
  #   When I visit a published job
  #   Then I see it data
  scenario 'visitor sees job page' do
    job = FactoryGirl.create(:job, status: Job.statuses[:published])
    visit job_path(job)
    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.company.title
    expect(page).to have_content job.job_type.title
    expect(page).to have_content job.salary
    expect(page).to have_content job.location
  end

  # Scenario: The visitor should not see how to apply section when the job has a link
  #   Given I am a visitor
  #   When I visit a job with an external link
  #   Then I see the link but I don't see the how to apply section
  scenario 'visitor sees a job that has link published' do
    job = FactoryGirl.create(:job, status: Job.statuses[:published], link: Faker::Internet.url, how_to_apply: 'Teste')
    visit job_path(job)
    expect(page).to have_content 'Candidatar'
    expect(page).to have_no_content job.how_to_apply
  end

  # Scenario: Admins can see remove job link
  #   Given I am a admin
  #   When I visit a published job
  #   Then I see the remove job link
  scenario 'admin see remove job link' do
    job = FactoryGirl.create(:job, status: Job.statuses[:published])
    admin = FactoryGirl.create(:admin)
    signin(admin.email, admin.password)
    visit job_path(job)
    expect(page).to have_content 'Remover vaga'
  end
end
