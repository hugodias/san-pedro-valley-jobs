# Feature: Job approve
#   As an admin
#   I want to approve a job
#   So it will be available in website
feature "Job approve", :devise do
  # Scenario: Admin can approve a job
  #   Given I am a admin
  #   When I visit the dashboard
  #   I click in the one job in the list
  #   After that I click in approve
  #   Then I see it success message
  scenario "admin can approve a job" do
    job   = FactoryGirl.create(:job)
    admin = FactoryGirl.create(:admin)

    signin(admin.email, admin.password)

    visit dashboard_root_path

    click_on job.title

    click_on "Aprovar vaga"

    expect(page).to have_content "Vaga publicada no SPV"
  end
end
