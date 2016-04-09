class PlateRatingsController < ApplicationController
  before_action :set_plate_rating, only: [:show, :edit, :update, :destroy]

  # GET /plate_ratings
  def index    
    @term = params[:term]
    @where = []
    
    @where << "plate_ratings" + '.' + "client_id" + ' LIKE :term' 
    
    @where << "plates" + '.' + "title" + ' LIKE :term' 
    
    @where << "plate_ratings" + '.' + "score" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @plate_ratings = PlateRating.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @plate_ratings = PlateRating.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /plate_ratings/1
  def show
  end

  # GET /plate_ratings/new
  def new
    @plate_rating = PlateRating.new
    @plates = Plate.all
  end

  # GET /plate_ratings/1/edit
  def edit
  end

  # POST /plate_ratings
  def create
    @plate_rating = PlateRating.new(plate_rating_params)
    @plates = Plate.all

    if @plate_rating.save
      redirect_to plate_ratings_path, :flash =>{:success => 'Rating de Prato foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /plate_ratings/1
  def update
    if @plate_rating.update(plate_rating_params)
      redirect_to plate_ratings_path, :flash =>{:success => 'Rating de Prato foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /plate_ratings/1
  def destroy
    @plate_rating.destroy
    redirect_to plate_ratings_path, :flash =>{:success => 'Rating de Prato foi removido com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate_rating
      @plate_rating = PlateRating.find(params[:id])
      @plates = Plate.all
    end

    # Only allow a trusted parameter "white list" through.
    def plate_rating_params
      params.require(:plate_rating).permit(:client_id, :plate_id, :score)
    end
end
