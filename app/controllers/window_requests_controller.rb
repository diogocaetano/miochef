class WindowRequestsController < ApplicationController
  before_action :set_window_request, only: [:show, :edit, :update, :destroy]

  # GET /window_requests
  def index    
    @term = params[:term]
    @where = []
    
    @where << "window_requests" + '.' + "initial_time" + ' LIKE :term' 
    
    @where << "window_requests" + '.' + "final_time" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @window_requests = WindowRequest.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @window_requests = WindowRequest.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /window_requests/1
  def show
  end

  # GET /window_requests/new
  def new
    @window_request = WindowRequest.new
  end

  # GET /window_requests/1/edit
  def edit
  end

  # POST /window_requests
  def create
    @window_request = WindowRequest.new(window_request_params)

    if @window_request.save
      redirect_to window_requests_path, :flash =>{:success => 'Janela de Entrega foi criada com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /window_requests/1
  def update
    if @window_request.update(window_request_params)
      redirect_to window_requests_path, :flash =>{:success => 'Janela de Entrega foi atualizada com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /window_requests/1
  def destroy
    @window_request.destroy
    redirect_to window_requests_path, :flash =>{:success => 'Janela de Entrega foi removida com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_window_request
      @window_request = WindowRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def window_request_params
      params.require(:window_request).permit(:initial_time, :final_time)
    end
end
