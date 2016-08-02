require "rails_helper"

describe Jobs::JobApprover do
  context "on success" do
    let(:job) { FactoryGirl.create :job }

    it "changes job status to published" do
      Jobs::JobApprover.run(job)
      job.reload
      expect(job.published?).to be true
    end

    it "enqueue job published mail" do
      expect{ Jobs::JobApprover.run(job) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
