class ChefRatingsController < ApplicationController
  before_action :set_chef_rating, only: [:show, :edit, :update, :destroy]

  # GET /chef_ratings
  def index    
    @term = params[:term]
    @where = []
    
    @where << "chef_ratings" + '.' + "client_id" + ' LIKE :term' 
    
    @where << "chefs" + '.' + "name" + ' LIKE :term' 
    
    @where << "chef_ratings" + '.' + "score" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @chef_ratings = ChefRating.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @chef_ratings = ChefRating.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /chef_ratings/1
  def show
  end

  # GET /chef_ratings/new
  def new
    @chef_rating = ChefRating.new
    @chefs = Chef.all
  end

  # GET /chef_ratings/1/edit
  def edit
  end

  # POST /chef_ratings
  def create
    @chef_rating = ChefRating.new(chef_rating_params)
    @chefs = Chef.all

    if @chef_rating.save
      redirect_to chef_ratings_path, :flash =>{:success => 'Rating de Chefe foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /chef_ratings/1
  def update
    if @chef_rating.update(chef_rating_params)
      redirect_to chef_ratings_path, :flash =>{:success => 'Rating de Chefe foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /chef_ratings/1
  def destroy
    @chef_rating.destroy
    redirect_to chef_ratings_path, :flash =>{:success => 'Rating de Chefe foi removido com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef_rating
      @chef_rating = ChefRating.find(params[:id])
      @chefs = Chef.all
    end

    # Only allow a trusted parameter "white list" through.
    def chef_rating_params
      params.require(:chef_rating).permit(:client_id, :chef_id, :score)
    end
end
