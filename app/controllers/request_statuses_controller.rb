class RequestStatusesController < ApplicationController
  before_action :set_request_status, only: [:show, :edit, :update, :destroy]

  # GET /request_statuses
  def index    
    @term = params[:term]
    @where = []
    
    @where << "request_statuses" + '.' + "name" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @request_statuses = RequestStatus.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @request_statuses = RequestStatus.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /request_statuses/1
  def show
  end

  # GET /request_statuses/new
  def new
    @request_status = RequestStatus.new
  end

  # GET /request_statuses/1/edit
  def edit
  end

  # POST /request_statuses
  def create
    @request_status = RequestStatus.new(request_status_params)

    if @request_status.save
      redirect_to request_statuses_path, :flash =>{:success => 'Status do Pedido foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /request_statuses/1
  def update
    if @request_status.update(request_status_params)
      redirect_to request_statuses_path, :flash =>{:success => 'Status do Pedido foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /request_statuses/1
  def destroy
    @request_status.destroy
    respond_to do |format|
      if not @request_status.errors.any?
        format.html { redirect_to :back, :flash =>{:success => 'O Status do Pedido foi removido com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: @request_status.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_status
      @request_status = RequestStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_status_params
      params.require(:request_status).permit(:name)
    end
end
