class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_chef_from_address, only: [:edit]


  # GET /addresses
  # GET /addresses.json
  def index
    @chef = Chef.find(params[:chef_id])
    @addresses = Address.where(chef_id: @chef.id).order('main desc').order('created_at asc')
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
        format.html { redirect_to chefs_url, :flash =>{:success => "O endereço adicionado com sucesso ao chefe: #{@address.chef.name }." } } 
      else
        @chefs = Chef.all
        format.html { render :template => 'chefs/index' }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @chef = Chef.find(params[:chef_id])
    @addresses = Address.where(chef_id: @chef.id).order('main desc').order('created_at asc')
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to chefs_url, :flash =>{:success => "O endereço foi atualizado com sucesso ao chefe: #{@address.chef.name }." } } 
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
    @chef = Chef.find(@address.chef_id)
    if @address.destroy
      respond_to do |format|
        format.html { redirect_to chefs_url, :flash =>{:success => "O endereço removido com sucesso ao chefe: #{@address.chef.name }." } } 
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to chefs_url, :flash =>{:warning => @address.errors.full_messages.join('<br>') } } 
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_chef_addresses
      @address = Address.where(chef_id: params[:chef_id])
    end

    def set_chef_from_address
      address = Address.find(params[:id])
      @chef = Chef.find(address.chef_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:chef_id, :public_place, :number, :neighborhood, :city, :state, :zip_code, :complement, :main)
    end
end
