class PlateBadgesController < ApplicationController
  before_action :set_plate_badge, only: [:show, :edit, :update, :destroy]

  # GET /plate_badges
  # GET /plate_badges.json
  def index
    @plate_badges = PlateBadge.all
  end

  # GET /plate_badges/1
  # GET /plate_badges/1.json
  def show
  end

  # GET /plate_badges/new
  def new
    @plate_badge = PlateBadge.new
  end

  # GET /plate_badges/1/edit
  def edit
  end

  # POST /plate_badges
  # POST /plate_badges.json
  def create
    @plate_badge = PlateBadge.new(plate_badge_params)

    respond_to do |format|
      if @plate_badge.save
        format.html { redirect_to @plate_badge, notice: 'Plate badge was successfully created.' }
        format.json { render :show, status: :created, location: @plate_badge }
      else
        format.html { render :new }
        format.json { render json: @plate_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plate_badges/1
  # PATCH/PUT /plate_badges/1.json
  def update
    respond_to do |format|
      if @plate_badge.update(plate_badge_params)
        format.html { redirect_to @plate_badge, notice: 'Plate badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @plate_badge }
      else
        format.html { render :edit }
        format.json { render json: @plate_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plate_badges/1
  # DELETE /plate_badges/1.json
  def destroy
    @plate_badge.destroy
    respond_to do |format|
      format.html { redirect_to plate_badges_url, notice: 'Plate badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate_badge
      @plate_badge = PlateBadge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_badge_params
      params.require(:plate_badge).permit(:name, :description, :image)
    end
end