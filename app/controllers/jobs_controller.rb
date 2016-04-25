class JobsController < ApplicationController
  load_and_authorize_resource except: [:index]
  respond_to :html

  before_action :set_job, only: [:approve, :reprove]
  before_action :check_token, only: [:approve, :reprove]

  def index
    if params[:query].present? && !params[:query][:q].blank?
      query = params[:query][:q]
    else
      query = '*'
    end

    @jobs = Job.query(query, params[:page])
    @query = query if query != '*'
  end

  def new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = 'Tudo pronto. A vaga ja foi salva, agora precisamos analisar e decidir se a mesma será publicada ou não. Você receberá um e-mail com a resposta em algumas horas.'

      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
  end

  def approve
    if @job.pending?
      @job.published!
      flash[:notice] = 'Vaga publicada no SPV'
      # TODO: Enviar email para quem cadastrou
      # TODO: Enviar email para assinantes
    end
    redirect_to company_job_path(@job.company, @job)
  end

  def reprove
    if @job.pending?
      @job.reproved!
      flash[:notice] = 'Vaga reprovada'
      # TODO: Enviar email para quem cadastrou
    end
    redirect_to root_url
  end

  private

  def job_params
    params.require(:job).permit(:title, :salary, :location, :description, :link, :company_id, :category_id, :job_type_id, :how_to_apply, :author, :author_email)
  end

  def check_token
    unless @job.token == params[:token]
      raise ActionController::RoutingError.new('Token Inválido')
    end
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
