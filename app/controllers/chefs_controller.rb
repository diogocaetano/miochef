class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]

  # GET /chefs
  # GET /chefs.json
  def index
    @address = Address.new
    @term = params[:term]
    @where = []    
    @where << "chefs.name LIKE :term"
    @where << "chefs.cpf LIKE :term"
    @where << "chefs.rg LIKE :term"
    @where << "chefs.email LIKE :term"
    @where << "chefs.phone_one LIKE :term"
    @where << "chefs.specialty LIKE :term"
    @where << "chefs.naturalness LIKE :term"
    @where = @where.join(" OR ")
    @chefs = Chef.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /chefs/1
  # GET /chefs/1.json
  def show
  end

  # GET /chefs/new
  def new
    @chef = Chef.new
  end

  # GET /chefs/1/edit
  def edit
  end

  # POST /chefs
  # POST /chefs.json
  def create
    badges = Badge.where(id: params[:badge_ids])
    @chef = Chef.new(chef_params)
    @chef.badges.clear
    @chef.badges << badges
    respond_to do |format|
      if @chef.save
        format.html { redirect_to chefs_url, :flash =>{:success => 'O chef foi criado com sucesso.' } } 
        format.json { render :show, status: :created, location: @chef }
      else
        format.html { render :new }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chefs/1
  # PATCH/PUT /chefs/1.json
  def update
    badges = Badge.where(id: params[:badge_ids])
    @chef.badges.clear
    @chef.badges << badges
    respond_to do |format|
      if @chef.update(chef_params)
        format.html { redirect_to chefs_url, :flash =>{:success => 'O chef foi atualizado com sucesso.' } } 
        format.json { render :show, status: :ok, location: @chef }
      else
        format.html { render :edit }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chefs/1
  # DELETE /chefs/1.json
  def destroy
    @chef.destroy
    respond_to do |format|
      if not @chef.errors.any?
        format.html { redirect_to chefs_url, :flash =>{:success => 'O chef foi removido com sucesso.' } } 
        format.json { head :no_content }
      else
        format.html { redirect_to chefs_url, alert: @chef.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef
      @chef = Chef.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_params
      params.require(:chef).permit(:name, :description, :cpf, :rg, :born_date, :country_id, :email, :phone_one, :phone_two, :specialty, :naturalness, :academic_education, :university, :active, :photo, :chef_type_id, { :badge_ids => [] })
    end
end
