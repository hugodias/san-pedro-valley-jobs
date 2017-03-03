require "rails_helper"

RSpec.describe Company, type: :model do
  it "must not allow duplicate titles even with case differences" do
    create(:company, title: 'Company')
    second_company = build(:company, title: 'company')
    expect(second_company).to be_invalid
  end
end
