class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]

  # GET /plates
  # GET /plates.json
  def index
    @plates = Plate.all
  end

  # GET /plates/1
  # GET /plates/1.json
  def show
  end

  # GET /plates/new
  def new
    @plate = Plate.new
    @types = PlateType.all
    @badges = PlateBadge.all
  end

  # GET /plates/1/edit
  def edit
    @types = PlateType.all
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = Plate.new(plate_params)
    @types = PlateType.all
    @badges = PlateBadge.all

    respond_to do |format|
      if @plate.save
        format.html { redirect_to @plate, notice: 'Prato criado com sucesso.' }
        format.json { render :show, status: :created, location: @plate }
      else
        format.html { render :new }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    respond_to do |format|
      if @plate.update(plate_params)
        format.html { redirect_to @plate, notice: 'Prato atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @plate }
      else
        format.html { render :edit }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate.destroy
    respond_to do |format|
      format.html { redirect_to plates_url, notice: 'Prato removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
      @types = PlateType.all
      @badges = PlateBadge.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_params
      params.require(:plate).permit(:title, :description, :price, :available_quantity, :photo, :active, :chef_id, :plate_type_id, :ingredients_id, :plate_accompaniment_id, :plate_badge_ids => [])
    end
end