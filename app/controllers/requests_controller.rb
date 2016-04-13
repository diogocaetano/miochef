class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  def index    
    @statuses = RequestStatus.all
    @term = params[:term]
    @where = []
    
    @where << "requests" + '.' + "client_id" + ' LIKE :term' 
    
    @where << "requests" + '.' + "client_address_id" + ' LIKE :term' 
    
    @where << "requests" + '.' + "payment_code" + ' LIKE :term' 
    
    @where << "requests" + '.' + "request_date" + ' LIKE :term' 
    
    @where << "requests" + '.' + "delivery_date" + ' LIKE :term' 
    
    @where << "requests" + '.' + "delivery_window" + ' LIKE :term' 
    
    @where << "requests" + '.' + "request_status_id" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @requests = Request.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @requests = Request.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /requests/1
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    @windows = WindowRequest.all
    @clients = Client.all
    @statuses = RequestStatus.all
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    @windows = WindowRequest.all
    @clients = Client.all
    @statuses = RequestStatus.all

    if @request.save
      redirect_to requests_path, :flash =>{:success => 'Pedido foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      redirect_to requests_path, :flash =>{:success => 'Pedido foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    redirect_to requests_path, :flash =>{:success => 'Pedido foi removido com sucesso.' }
  end

  def update_status
    @request = Request.find(params[:request_id])
    @request.request_status_id = params['request'][:request_status_id]
    @request.save
    respond_to do |format|
      format.html { redirect_to :back, :flash =>{:success => 'Status do Pedido atualizado com sucesso.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
      @windows = WindowRequest.all
      @clients = Client.all
      @statuses = RequestStatus.all
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:client_id, :client_address_id, :payment_code, :request_date, :delivery_date, :delivery_window, :request_status_id)
    end
end
