module Jobs

  class CompanyCreator < GoodServices::Base

    attr_reader :company
    attr_reader :errors

    def initialize(attributes)
      @company = Company.where('lower(title) = ?', attributes[:title].try(:downcase)).first
      @company ||= Company.new(:title => attributes[:title])

      @company.assign_attributes(attributes.except(:title))
    end

    def perform
      if @company.valid?
        @company.save
        return true
      else
        @errors = @company.errors.full_messages
        return false
      end
    end
  end
end
