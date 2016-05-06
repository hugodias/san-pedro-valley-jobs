require 'spec_helper'

RSpec.describe JobMailer do
  describe 'created' do
    let(:job) { FactoryGirl.create(:job) }
    let(:mail) { described_class.job_created(job).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq "[SPV Jobs] Revisar vaga: #{job.title}"
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([ENV['ADMIN_EMAIL']])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([ENV['DEFAULT_FROM']])
    end

    it 'assigns @title' do
      expect(mail.body.encoded).to match(job.title)
    end
  end

  describe 'approved' do
    let(:job) { FactoryGirl.create(:job) }
    let(:mail) { described_class.job_approved(job).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq "[SPV Jobs] Sua vaga foi aprovada :)"
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([job.author_email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([ENV['DEFAULT_FROM']])
    end

    it 'assigns @title' do
      expect(mail.body.encoded).to match(job.title)
    end

    it 'assigns state' do
      expect(mail.body.encoded).to match("aprovada")
    end
  end

  describe 'reproved' do
    let(:job) { FactoryGirl.create(:job) }
    let(:mail) { described_class.job_reproved(job).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq "[SPV Jobs] Sua vaga foi reprovada :/"
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([job.author_email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([ENV['DEFAULT_FROM']])
    end

    it 'assigns @title' do
      expect(mail.body.encoded).to match(job.title)
    end

    it 'assigns state' do
      expect(mail.body.encoded).to match("reprovada")
    end
  end
end
