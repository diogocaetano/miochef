class PlateAccompanimentsController < ApplicationController
  before_action :set_plate_accompaniment, only: [:show, :edit, :update, :destroy]

  # GET /plate_accompaniments
  # GET /plate_accompaniments.json
  def index
    @term = params[:term]
    @where = []    
    @where << "plate_accompaniments.name LIKE :term"
    @where = @where.join(" OR ")
    @plate_accompaniments = PlateAccompaniment.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /plate_accompaniments/1
  # GET /plate_accompaniments/1.json
  def show
  end

  # GET /plate_accompaniments/new
  def new
    @plate_accompaniment = PlateAccompaniment.new
  end

  # GET /plate_accompaniments/1/edit
  def edit
  end

  # POST /plate_accompaniments
  # POST /plate_accompaniments.json
  def create
    @plate_accompaniment = PlateAccompaniment.new(plate_accompaniment_params)

    respond_to do |format|
      if @plate_accompaniment.save
        format.html { redirect_to @plate_accompaniment, notice: 'Acompanhamento de prato salvo com sucesso.' }
        format.json { render :show, status: :created, location: @plate_accompaniment }
      else
        format.html { render :new }
        format.json { render json: @plate_accompaniment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plate_accompaniments/1
  # PATCH/PUT /plate_accompaniments/1.json
  def update
    respond_to do |format|
      if @plate_accompaniment.update(plate_accompaniment_params)
        format.html { redirect_to @plate_accompaniment, notice: 'Acompanhamento de prato atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @plate_accompaniment }
      else
        format.html { render :edit }
        format.json { render json: @plate_accompaniment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plate_accompaniments/1
  # DELETE /plate_accompaniments/1.json
  def destroy
    @plate_accompaniment.destroy
    respond_to do |format|
      if not @plate_accompaniment.errors.any?
        format.html { redirect_to plate_accompaniments_url, notice: 'Acompanhamento do prato removido com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to plate_accompaniments_url, alert: @plate_accompaniment.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate_accompaniment
      @plate_accompaniment = PlateAccompaniment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_accompaniment_params
      params.require(:plate_accompaniment).permit(:name)
    end
end
