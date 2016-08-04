# Feature: Create a new job
#   As a visitor
#   I want to create a new job
#   So other people can see it
feature "Create a new job", :devise do
  let!(:company) { FactoryGirl.create(:company) }
  let!(:job_type) { FactoryGirl.create(:job_type) }
  let!(:category) { FactoryGirl.create(:category) }

  before do
    visit new_job_path

    select company.title, from: "job[company_id]"
    fill_in "Seu nome",   with: Faker::Name.first_name
    fill_in "Seu e-mail", with: Faker::Internet.email

    find(".goto_step3").click
  end

  scenario "visitor can create a job successfully" do
    fill_in "Titulo da vaga", with: Faker::Name.name

    choose category.title
    choose job_type.title

    click_button "Publicar"
    expect(page).to have_content "a vaga foi salva com sucesso"
  end

  scenario "visitor cannot create a job without providing required info" do
    click_on "Publicar"
    expect(page).to have_content(/não pode ficar em branco/)
  end
end
