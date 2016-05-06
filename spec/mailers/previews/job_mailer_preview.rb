# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview

  def job_created
    JobMailer.job_created(Job.last)
  end

  def job_approved
    JobMailer.job_approved(Job.last)
  end

  def job_reproved
    JobMailer.job_reproved(Job.last)
  end
end
