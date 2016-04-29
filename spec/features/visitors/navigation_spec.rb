# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Navigation links', :devise do

  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Cadastrar vaga"
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_content 'Cadastrar vaga'
    expect(page).to have_content 'Newsletter'
    expect(page).to have_no_content 'Dashboard'
  end

end
