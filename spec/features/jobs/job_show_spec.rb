# Feature: Job page
#   As a visitor
#   I want to visit a job page
#   So I can see it data
feature 'Job page' do

  # Scenario: Visitor can see a published job
  #   Given I am a visitor
  #   When I visit a published job
  #   Then I see it data
  scenario 'visitor sees job page' do
    job = FactoryGirl.create(:job, status: 'published')
    visit company_job_path(job.company, job)
    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.company.title
    expect(page).to have_content job.job_type.title
    expect(page).to have_content job.salary
    expect(page).to have_content job.location
  end
end
