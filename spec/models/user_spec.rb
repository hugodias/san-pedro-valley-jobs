require "cancan/matchers"

describe User do
  before(:each) do
    @user = User.new(email: "user@example.com")
    @job = FactoryGirl.build(:job)
    @published_job = FactoryGirl.build(:job, status: Job.statuses[:published])
    @pending_job = FactoryGirl.build(:job, status: Job.statuses[:pending])
    @company = FactoryGirl.build(:company)
  end

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match "user@example.com"
  end

  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context "when is a visitor" do
      let(:user) { User.new }

      it { should be_able_to(:create, Job.new) }
      it { should be_able_to(:read, @published_job) }
      it { should_not be_able_to(:read, @pending_job) }
      it { should be_able_to(:read, @company) }
      it { should_not be_able_to(:update, @job) }
    end

    context "when is an admin" do
      let(:user) { FactoryGirl.build(:admin) }

      it { should be_able_to(:manage, FactoryGirl.build(:job)) }
      it { should be_able_to(:manage, FactoryGirl.build(:company)) }
    end
  end
end
