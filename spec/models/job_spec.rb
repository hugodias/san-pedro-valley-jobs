require "cancan/matchers"

describe Job do
  describe "validation" do
    context "when saving" do
      it "cannot be saved without a title" do
        @job = FactoryGirl.build(:job, title: nil)
        @job.valid?
        expect(@job.errors[:title]).to include("não pode ficar em branco")
      end

      it "cannot be saved without a job_type" do
        @job = FactoryGirl.build(:job, job_type: nil)
        @job.valid?
        expect(@job.errors[:job_type]).to include("não pode ficar em branco")
      end

      it "cannot be saved without a category" do
        @job = FactoryGirl.build(:job, category: nil)
        @job.valid?
        expect(@job.errors[:category]).to include("não pode ficar em branco")
      end

      it "cannot be saved without a company" do
        @job = FactoryGirl.build(:job, company: nil)
        @job.valid?
        expect(@job.errors[:company]).to include("não pode ficar em branco")
      end

      it "cannot be saved with a wrong link" do
        @job = FactoryGirl.build(:job, link: 'Foobar')
        @job.valid?
        expect(@job.errors[:link]).to include("não é válido")

        @job.link = Faker::Internet.url
        expect(@job.valid?).to be true
      end
    end
  end

  describe "states" do
    context "when creating" do
      it "should have a pending status by default" do
        @job = FactoryGirl.build(:job)
        @job.save

        expect(@job.pending?).to be true
      end
    end
    context "when updating" do
      it "can only be published by adminstrators" do
        @job = FactoryGirl.create(:job)
        user = FactoryGirl.create(:user)
        ability = Ability.new(user)

        expect(ability).to_not be_able_to(:update, @job)

        admin = FactoryGirl.create(:admin)
        admin_ability = Ability.new(admin)

        expect(admin_ability).to be_able_to(:update, @job)
      end

      it "can only be removed by the author" do
        @job = FactoryGirl.create(:job)
        fake_author_email = Faker::Internet.email
        fake_token = Faker::Bitcoin.address

        correct_email = @job.author_email
        correct_token = @job.token

        expect(@job.remove(fake_author_email, fake_token)).to be false
        expect(@job.remove(correct_email, correct_token)).to be true
      end
    end
    context "when viewing" do
      it "cannot be seen by visitors when pending" do
        @job= FactoryGirl.create(:job, status: Job.statuses[:pending])
        user = User.new
        ability = Ability.new(user)

        expect(ability).to_not be_able_to(:read, @job)
      end

      it "can be seen by admins when pending" do
        @job= FactoryGirl.create(:job, status: Job.statuses[:pending])
        user = FactoryGirl.create(:admin)
        ability = Ability.new(user)

        expect(ability).to be_able_to(:read, @job)
      end
    end
  end

  describe "retrieving" do
    context "on dashboard" do
      it "can retrieve visible jobs" do
        FactoryGirl.create_list(:job, 5)
        FactoryGirl.create_list(:job, 5, status: Job.statuses[:published])

        @jobs = Job.visible
        expect(@jobs.count).to eq(5)
      end

      it "can retrieve jobs awaiting approval" do
        FactoryGirl.create_list(:job, 5)
        FactoryGirl.create_list(:job, 5, status: Job.statuses[:published])

        @jobs = Job.awaiting_approval
        expect(@jobs.count).to eq(5)
      end
    end

    context "searching" do
      it "can search by name" do
      end
    end
  end
end
