require "rails_helper"

describe Admins::UserCreator do
  context "on success" do

    let(:params) { { email: "foobar@example.com", password: "foobarpassword" } }

    subject { Admins::UserCreator.run!(**params) }

    it "creates a new user" do
      expect{ subject }
        .to change{User.count}.by(1)
    end

    it "creates an admin user" do
      params[:admin] = true
      service = Admins::UserCreator.new(**params)
      service.run!
      expect(service.record.admin?).to be true
    end
  end
  context "on failure" do
    let(:params) { { email: nil, password: nil } }

    it "returns false when something is wrong" do
      expect(Admins::UserCreator.run(**params)).to be false
    end

    it "raises an exception when using the bang operator" do
      expect { Admins::UserCreator.run!(**params) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
