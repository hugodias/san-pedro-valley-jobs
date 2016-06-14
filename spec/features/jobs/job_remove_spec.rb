# Feature: Job remove
#   As a author or admin
#   I want to remove a job
#   So it won"t be available in website anymore
feature "Job removal", :devise do
  # Scenario: Admin can remove a job
  #   Given I am a admin
  #   When I click in remove job
  #   Then I see it success message
  scenario "admin can remove a job" do
    job   = FactoryGirl.create(:job, status: Job.statuses[:published])
    admin = FactoryGirl.create(:admin)

    signin(admin.email, admin.password)

    visit job_path(job)

    click_link "Remover vaga"
    expect(page).to have_content "Vaga removida do site."
  end
end
