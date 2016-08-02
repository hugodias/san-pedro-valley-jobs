module Jobs
  class JobCreator < GoodServices::Base
    rescuable_from ActiveRecord::RecordInvalid

    def initialize(params)
      @record = Job.new(params)
    end

    def perform
      record.save!
      record.send_mail_to_admins
    end
  end
end
