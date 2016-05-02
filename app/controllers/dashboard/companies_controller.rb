module Dashboard
  class CompaniesController < DashboardController
    before_action :fetch_companies
    load_and_authorize_resource

    def index
    end

    def show
    end

    private

    def fetch_companies
      @companies = Company.order(title: :asc).page params[:page]
    end
  end
end
