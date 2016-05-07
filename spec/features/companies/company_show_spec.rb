# Feature: Company page
#   As a visitor
#   I want to visit a company page
#   So I can see it job offers
feature "Company page" do
  # Scenario: Visitor can see any company
  #   Given I am a visitor
  #   When I visit a company
  #   Then I see it information
  scenario "visitor sees company page" do
    company = FactoryGirl.create(:company)
    visit company_path(company)
    expect(page).to have_content company.title
  end

  # Scenario: Visitor can see only published jobs in company page
  #   Given I am a visitor
  #   When I visit a company
  #   Then I see it published job offers
  scenario "visitor sees only published jobs" do
    company = FactoryGirl.create(:company)
    FactoryGirl.create_list(:job, 3, company: company)
    FactoryGirl.create(:job,
                       status: Job.statuses[:published],
                       company: company)

    visit company_path(company)
    expect(page).to have_content "Job 4"
    expect(page).to have_no_content "Job 1"
  end
end
