class JobMailer < ApplicationMailer
  default from: ENV['DEFAULT_FROM']

  def job_created(job)
    @job = job
    mail(to: ENV['ADMIN_EMAIL'], subject: "Revisar vaga: #{job.title}")
  end
end
