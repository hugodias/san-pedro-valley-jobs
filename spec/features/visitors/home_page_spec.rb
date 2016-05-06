# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can view the latest jobs published
feature "Home page" do
  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see the title of the last published job
  scenario "visit the home page" do
    job = FactoryGirl.create(:job, status: Job.statuses[:published])
    visit root_path
    expect(page).to have_content job.title
  end

  # Scenario: Navigate using pagination
  #   Given I am a visitor
  #   When i visit the home page
  #   Then i see the pagination next page link and click on it
  #   So i can see the next page
  scenario "navigate using pagination" do
    published_jobs = FactoryGirl.create_list(
      :job,
      25,
      status: Job.statuses[:published])
    first_job_second_page = published_jobs[10]
    visit root_path
    expect(page).to have_content "Próxima"
    click_link "Próxima"
    expect(page).to have_content first_job_second_page.title
    expect(page).to have_content "Anterior"
  end
end
