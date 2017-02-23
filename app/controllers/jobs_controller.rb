class JobsController < ApplicationController
  load_and_authorize_resource except: [:index, :feed]
  respond_to :html

  before_action :set_job, only: [:approve, :reprove]
  before_action :check_token, only: [:approve, :reprove]

  def index
    query = nil

    if params[:query].present? && !params[:query][:q].blank?
      query = params[:query][:q]
    end

    @jobs = Job.query(query, params[:page])
    @query = query unless query.nil?
  end

  def feed
    @jobs = Job.visible

    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  def new
  end

  def create
    service = Jobs::JobCreator.new(job_params)

    if service.run
      flash[:notice] = "Tudo pronto, a vaga foi salva com sucesso."\
      " Precisamos analisar e decidir se a mesma será publicada "\
      "ou não no site. Você receberá um e-mail com a resposta em breve."

      redirect_to root_url
    else
      @job = service.record
      render "new"
    end
  end

  def show
  end

  def approve
    service = Jobs::JobApprover.new(@job)
    if service.run
      flash[:notice] = "Vaga publicada no SPV"
    end
    redirect_to job_path(@job)
  end

  def reprove
    if @job.pending?
      @job.reproved!
      @job.send_reproved_mail
      flash[:notice] = "Vaga reprovada"
    end
    redirect_to dashboard_root_path
  end

  def remove
    if @job.published?
      @job.removed!
      flash[:notice] = "Vaga removida do site."
    end
    redirect_to root_url
  end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :salary,
      :location,
      :description,
      :link,
      :company_id,
      :category_id,
      :job_type_id,
      :how_to_apply,
      :author,
      :author_email,
      :company_params => [
          :title,
          :website,
          :email,
          :address
      ]
    )
  end

  def check_token
    unless @job.token == params[:token]
      raise ActionController::RoutingError.new("Token Inválido")
    end
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
