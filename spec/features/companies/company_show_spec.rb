# Feature: Company page
#   As a visitor
#   I want to visit a company page
#   So I can see it job offers
feature "Job page" do
  # Scenario: Visitor can see any company
  #   Given I am a visitor
  #   When I visit a company
  #   Then I see it job offers
  scenario "visitor sees company page" do
    company = FactoryGirl.create(:company_with_jobs)
    first_job = company.jobs.first
    visit company_path(company)
    expect(page).to have_content company.title
    expect(page).to have_content first_job.title
  end
end
