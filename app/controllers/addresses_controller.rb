class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_chef_addresses, only: [:index]
  before_action :set_chef, only: [:index]
  before_action :set_chef_from_address, only: [:edit]


  # GET /addresses
  # GET /addresses.json
  def index
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
        format.html { redirect_to chefs_url, notice: "Endereço Adicionado com Sucesso ao Chefe: #{@address.chef.name }." }
      else
        @chefs = Chef.all
        format.html { render :template => 'chefs/index' }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @chef = Chef.find(address_params[:chef_id])
    @chefs = Chef.all
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to chefs_url, notice: "Endereço Atualizado com Sucesso ao Chefe: #{@chef.name }." }
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
    @address.destroy
    chef = Chef.find(@address.chef_id)
    respond_to do |format|
      format.html { redirect_to chefs_url, notice: "Endereço do chefe #{chef.name} removido com sucesso" }
      format.json { head :no_content }
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

    def set_chef
      @chef = Chef.find(params[:chef_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:chef_id, :public_place, :number, :neighborhood, :city, :state, :zip_code, :complement, :main)
    end
end
