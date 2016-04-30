require "cancan/matchers"

describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is a visitor" do
      let(:user) { User.new }

      it { should be_able_to(:create, Job.new) }
      it { should be_able_to(:read, FactoryGirl.build(:job, status: Job.statuses[:published])) }
      it { should_not be_able_to(:read, FactoryGirl.build(:job, status: Job.statuses[:pending])) }
      it { should be_able_to(:read, FactoryGirl.build(:company)) }
      it { should_not be_able_to(:update, FactoryGirl.build(:job)) }
    end
    
    context "when is an admin" do
      let(:user){ FactoryGirl.build(:admin) }

      it{ should be_able_to(:manage, FactoryGirl.build(:job)) }
      it{ should be_able_to(:manage, FactoryGirl.build(:company)) }
    end
  end
end
