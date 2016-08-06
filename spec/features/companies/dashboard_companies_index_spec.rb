# Feature: Company page
#   As a visitor
#   I want to visit a company page
#   So I can see it job offers
feature "Dasbboard Compoanies" do
  before do
    admin = FactoryGirl.create(:admin)
    signin(admin.email, admin.password)
  end

  # Scenario: Visitor can see any company
  #   Given I am a visitor
  #   When I visit a company
  #   Then I see it information
  scenario "admins can view list of companies" do
    FactoryGirl.create_list(:company, 10)
    visit dashboard_companies_path
    expect(page).to have_content Company.take.title
  end
end
