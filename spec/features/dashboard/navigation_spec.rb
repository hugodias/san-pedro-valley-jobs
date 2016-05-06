# Feature: Dashboard Navigation links
#   As a admin
#   I want to see navigation links
#   So I can find Newsletter, Cadastrar Vaga, Dashboard and Sign out
feature "Navigation links", :devise do
  # Scenario: View secret links
  #   Given I am a admin
  #   When I visit the home page and I am logged in
  #   Then I see "Dashboard"
  scenario "view secret links" do
    admin = FactoryGirl.create(:admin)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_content "Dashboard"
  end

  scenario "normal users cannot see secret links" do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_no_content "Dashboard"
  end
end
