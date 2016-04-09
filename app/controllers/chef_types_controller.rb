class ChefTypesController < ApplicationController
  before_action :set_chef_type, only: [:show, :edit, :update, :destroy]

  # GET /chef_types
  # GET /chef_types.json
  def index
    @term = params[:term]
    @where = []    
    @where << "chef_types.name LIKE :term"
    @where = @where.join(" OR ")
    @chef_types = ChefType.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /chef_types/1
  # GET /chef_types/1.json
  def show
  end

  # GET /chef_types/new
  def new
    @chef_type = ChefType.new
  end

  # GET /chef_types/1/edit
  def edit
  end

  # POST /chef_types
  # POST /chef_types.json
  def create
    @chef_type = ChefType.new(chef_type_params)

    respond_to do |format|
      if @chef_type.save
        format.html { redirect_to chef_types_url, :flash =>{:success => 'O tipo de chefe foi criado com sucesso.' } } 
        format.json { render :show, status: :created, location: @chef_type }
      else
        format.html { render :new }
        format.json { render json: @chef_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chef_types/1
  # PATCH/PUT /chef_types/1.json
  def update
    respond_to do |format|
      if @chef_type.update(chef_type_params)
        format.html { redirect_to chef_types_url, :flash =>{:success => 'O tipo de chefe foi atualizado com sucesso.' } } 
        format.json { render :show, status: :ok, location: @chef_type }
      else
        format.html { render :edit }
        format.json { render json: @chef_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_types/1
  # DELETE /chef_types/1.json
  def destroy
    @chef_type.destroy
    respond_to do |format|
      format.html { redirect_to chef_types_url, :flash =>{:success => 'O tipo de chefe foi removido com sucesso.' } } 
      format.json { head :no_content }
    end
  rescue
    respond_to do |format|
      format.html { redirect_to chef_types_url, :flash =>{:danger =>  'O tipo de chefe não foi removido. Existem associações para o registro.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef_type
      @chef_type = ChefType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_type_params
      params.require(:chef_type).permit(:chef_id, :name)
    end
end
