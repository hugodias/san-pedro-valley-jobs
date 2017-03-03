module Jobs

  class JobCreator < GoodServices::Base
    rescuable_from ActiveRecord::RecordInvalid

    def initialize(params)
      company_service = Jobs::CompanyCreator.new(params[:company_params].to_hash)
      @record         = Job.new(params.except(:company_params))

      company_service.run

      record.company = company_service.company
    end

    def perform
      record.save!
      record.send_mail_to_admins
    end
  end
end
