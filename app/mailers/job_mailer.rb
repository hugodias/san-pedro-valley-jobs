class JobMailer < ApplicationMailer
  default from: ENV['DEFAULT_FROM']
  layout 'jobmailer'

  def job_created(job)
    @job = job
    mail(to: ENV['ADMIN_EMAIL'], subject: "[SPV Jobs] Revisar vaga: #{job.title}")
  end

  def job_approved(job)
    @job = job
    mail(to: job.author_email, subject: "[SPV Jobs] Sua vaga foi aprovada :)")
  end

  def job_reproved(job)
    @job = job
    mail(to: job.author_email, subject: "[SPV Jobs] Sua vaga foi reprovada :/")
  end
end
