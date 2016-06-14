# Feature: Job reprove
#   As an admin
#   I want to reprove a job
#   So it will not be available in website
feature "Job reprove", :devise do
  # Scenario: Admin can reprove a job
  #   Given I am a admin
  #   When I visit the dashboard
  #   I click in the one job in the list
  #   After that I click in reprove
  #   Then I see it success message
  scenario "admin can reprove a job" do
    job   = FactoryGirl.create(:job)
    admin = FactoryGirl.create(:admin)

    signin(admin.email, admin.password)

    visit dashboard_root_path

    click_on job.title

    click_on "Reprovar."

    expect(page).to have_content "Vaga reprovada"
  end
end
