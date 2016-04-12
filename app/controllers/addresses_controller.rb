class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_related_object
  before_action :set_addresses, except: [:new, :edit]


  # GET /addresses
  # GET /addresses.json
  def index
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    respond_to do |format|
      if @address.save
        format.html { redirect_to chef_addresses_path, :flash =>{:success => "O endereço foi criado com sucesso." } } if not params[:chef_id].blank?
        format.html { redirect_to client_addresses_path, :flash =>{:success => "O endereço foi criado com sucesso." } } if not params[:client_id].blank?
      else
        format.html { render :new, :flash =>{:danger => @address.errors.full_messages.join('<br>') } }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to chef_addresses_path, :flash =>{:success => "O endereço foi atualizado com sucesso." } } if not params[:chef_id].blank?
        format.html { redirect_to client_addresses_path, :flash =>{:success => "O endereço foi atualizado com sucesso." } } if not params[:client_id].blank?
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    if @address.destroy
      respond_to do |format|
        format.html { redirect_to chef_addresses_path, :flash =>{:success => "O endereço removido com sucesso." } } if not params[:chef_id].blank?
        format.html { redirect_to client_addresses_path, :flash =>{:success => "O endereço removido com sucesso." } } if not params[:client_id].blank?
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to chef_addresses_path, :flash =>{:warning => @address.errors.full_messages.join('<br>') } } if not params[:chef_id].blank?
        format.html { redirect_to client_addresses_path, :flash =>{:warning => @address.errors.full_messages.join('<br>') } } if not params[:client_id].blank?
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_related_object
      @object = @chef = Chef.find(params[:chef_id]) if not params[:chef_id].blank?
      @object = @client = Client.find(params[:client_id]) if not params[:client_id].blank?
    end

    def set_addresses
      @addresses = Address.where(chef_id: @chef.id).order('main desc').order('created_at asc') if not params[:chef_id].blank?
      @addresses = Address.where(client_id: @client.id).order('main desc').order('created_at asc') if not params[:client_id].blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:client_id, :chef_id, :public_place, :number, :neighborhood, :city, :state, :zip_code, :complement, :main)
    end
end
