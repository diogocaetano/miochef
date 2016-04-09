class PlateTypesController < ApplicationController
  before_action :set_plate_type, only: [:show, :edit, :update, :destroy]

  # GET /plate_types
  # GET /plate_types.json
  def index
    @term = params[:term]
    @where = []
    @where << "plate_types.name LIKE :term"    
    @where = @where.join(" OR ")
    
    @plate_types = PlateType.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /plate_types/1
  # GET /plate_types/1.json
  def show
  end

  # GET /plate_types/new
  def new
    @plate_type = PlateType.new
  end

  # GET /plate_types/1/edit
  def edit
  end

  # POST /plate_types
  # POST /plate_types.json
  def create
    @plate_type = PlateType.new(plate_type_params)

    respond_to do |format|
      if @plate_type.save
        format.html { redirect_to plate_types_url, :flash =>{:success => 'O tipo do prato foi criado com sucesso.' } }
        format.json { render :show, status: :created, location: @plate_type }
      else
        format.html { render :new }
        format.json { render json: @plate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plate_types/1
  # PATCH/PUT /plate_types/1.json
  def update
    respond_to do |format|
      if @plate_type.update(plate_type_params)
        format.html { redirect_to plate_types_url, :flash =>{:success => 'O tipo do prato foi atualizado com sucesso.' } }
        format.json { render :show, status: :ok, location: @plate_type }
      else
        format.html { render :edit }
        format.json { render json: @plate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plate_types/1
  # DELETE /plate_types/1.json
  def destroy
    @plate_type.destroy
    respond_to do |format|
      if not @plate_type.errors.any?
        format.html { redirect_to plate_types_url, :flash =>{:success => 'O tipo do prato foi removido com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { redirect_to plate_types_url, alert: @plate_type.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate_type
      @plate_type = PlateType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_type_params
      params.require(:plate_type).permit(:name)
    end
end
