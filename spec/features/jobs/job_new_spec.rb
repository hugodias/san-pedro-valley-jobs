# Feature: Create a new job
#   As a visitor
#   I want to create a new job
#   So other people can see it
feature "Create a new job", :devise do
  # Scenario: Visitor can create a job
  #   Given I am a visitor
  #   When I visit a new job
  #   I fill all the required information
  #   And I submit
  #   Then I see the success message
  scenario "visitor can create a job" do
    company = FactoryGirl.create(:company)
    job_type = FactoryGirl.create(:job_type)
    category = FactoryGirl.create(:category)

    visit new_job_path
    select company.title, from: "job[company_id]"
    fill_in "Seu nome", with: Faker::Name.first_name
    fill_in "Seu e-mail", with: Faker::Internet.email
    find(".goto_step3").click
    fill_in "Titulo da vaga", with: Faker::Name.name
    choose category.title
    choose job_type.title
    click_button "Publicar"
    expect(page).to have_content "a vaga foi salva com sucesso"
  end
end
