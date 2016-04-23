# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview

  def job_created
    JobMailer.job_created(Job.last)
  end
end
