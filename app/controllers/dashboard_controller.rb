class DashboardController < ApplicationController
  before_action :authorize_dashboard
  layout 'dashboard'

  def index
    @jobs = Job.awaiting_approval
    @published_jobs = Job.published
  end

  private

  def authorize_dashboard
    authorize! :manage, :dashboard
  end
end
