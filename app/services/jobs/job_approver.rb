module Jobs
  InvalidJobStatus = Class.new(StandardError)

  class JobApprover < GoodServices::Base
    rescuable_from ActiveRecord::RecordInvalid, InvalidJobStatus

    attr_reader :job

    def initialize(job)
      @job = job
    end

    def perform
      raise InvalidJobStatus unless job.pending?

      job.published!
      job.send_approved_mail
    end
  end
end
