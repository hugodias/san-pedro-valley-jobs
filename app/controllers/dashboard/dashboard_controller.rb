module Dashboard
  class DashboardController < ApplicationController
    before_filter :authorize_dashboard
    layout "dashboard"

    def index
      @jobs = Job.awaiting_approval
      @published_jobs = Job.visible.count
      @startups = Company.count
    end

    private

    def authorize_dashboard
      authorize! :manage, :dashboard
    end
  end
end
