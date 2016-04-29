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
    @daily_plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1)
  end

  # GET /requests/1/edit
  def get_today_plate_tag day
    tags = [:sunday_available, :monday_available, :tuesday_available, :wednesday_available,
      :thursday_available, :friday_available, :saturday_available]
    tags[day]
  end

  def edit
    @daily_plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1)
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    @windows = WindowRequest.all
    @clients = Client.all
    @statuses = RequestStatus.all
    @daily_plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1)

    @has_plates = false
    tmp = params[:request_plates][:quantity] - ['0']

    if tmp.length > 0
      @has_plates = true
    end

    if @has_plates
      if @request.save
        save_request_plates @request.id

        redirect_to requests_path, :flash =>{:success => 'Pedido foi criado com sucesso.' }
      else
        render :new
      end
    else
      redirect_to new_request_path, :flash =>{:alert => 'É necessário ter pelo menos 1 prato cadastrado' }
    end
    
  end

  # PATCH/PUT /requests/1
  def update
    @has_plates = false
    tmp = params[:request_plates][:quantity] - ['0']
    if tmp.length > 0
      @has_plates = true
    end

    if @has_plates
      if @request.update(request_params)
        RequestPlate.destroy_all(request_id: params[:id])
        save_request_plates params[:id]
        redirect_to requests_path, :flash =>{:success => 'Pedido foi atualizado com sucesso.' }
      else
        render :edit
      end
    else
       redirect_to edit_request_path, :flash =>{:alert => 'É necessário ter pelo menos 1 prato cadastrado' }
      # render :edit
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
      @daily_plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1)
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:client_id, :client_address_id, :payment_code, :request_date, :delivery_date, :delivery_window, 
        :request_status_id, :request_plate => [:id => [], :price => [], :quantity => []])
    end

    def request_plates_params
      params.require(:request_plates).permit(:id => [], :price => [], :quantity => [])
    end

    def save_request_plates request_id
      i = 0
      while i < request_plates_params[:quantity].length do 
        if request_plates_params[:quantity][i] == '0'
          i += 1
          next
        end
        @request_plate = RequestPlate.new
        @request_plate.quantity = request_plates_params[:quantity][i]
        @request_plate.plate_id = request_plates_params[:id][i]
        @request_plate.price = request_plates_params[:price][i]
        @request_plate.request_id = request_id
        @request_plate.save
        i += 1
      end
    end
end
