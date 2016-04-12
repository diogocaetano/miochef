class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index    
    @term = params[:term]
    @where = []
    
    @where << "clients" + '.' + "name" + ' LIKE :term' 
    
    @where << "clients" + '.' + "last_name" + ' LIKE :term' 
    
    @where << "clients" + '.' + "email" + ' LIKE :term' 
    
    @where << "clients" + '.' + "cep" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @clients = Client.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @clients = Client.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path, :flash =>{:success => 'Cliente foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to clients_path, :flash =>{:success => 'Cliente foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_path, :flash =>{:success => 'Cliente foi removido com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :last_name, :email, :cep)
    end
end
