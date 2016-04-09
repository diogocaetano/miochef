class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]

  # GET /plates
  # GET /plates.json
  def index
    @term = params[:term]
    @where = []    

    @where << "plates.title LIKE :term"    
    @where << "plates.description LIKE :term"    
    @where << "plates.price LIKE :term"    
    @where << "plates.available_quantity LIKE :term"    
    @where << "plate_types.name LIKE :term"    
    @where = @where.join(" OR ")

    @plates = Plate.joins(:plate_type).where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
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
    @chefs = Chef.all
    @ingredients_list = Ingredient.all.map { |i| {text: i.name, value: i.id}}
    @plate_ingredients_list = @plate.ingredients.map { |i| {text: i.name, value: i.id} }
    @accompaniments_list = PlateAccompaniment.all.map { |p| {text: p.name, value: p.id}}
    @plate_accompaniments_list = @plate.plate_accompaniments.map { |p| {text: p.name, value: p.id} }
  end

  # GET /plates/1/edit
  def edit
    @types = PlateType.all
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = Plate.new(plate_params_with_ingredients_and_accompaniments)
    @types = PlateType.all
    @badges = PlateBadge.all
    @chefs = Chef.all

    respond_to do |format|
      if @plate.save
        format.html { redirect_to plates_url, :flash =>{:success => 'O prato foi criado com sucesso.' } }

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
      if @plate.update(plate_params_with_ingredients_and_accompaniments)
        format.html { redirect_to plates_url, :flash =>{:success => 'O prato foi atualizado com sucesso.' } }
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
      format.html { redirect_to plates_url, :flash =>{:success => 'O prato foi removido com sucesso.' } }
      format.json { head :no_content }
    end
  end

  def activate
    @plate = Plate.find(params[:plate_id])
    @plate.active = 1
    @plate.save
    respond_to do |format|
      format.html { redirect_to :back, :flash =>{:success => 'O prato foi ativado com sucesso.' } }
      format.json { head :no_content }
    end
  end

  def deactivate
    @plate = Plate.find(params[:plate_id])
    @plate.active = 0
    @plate.save
    respond_to do |format|
      format.html { redirect_to back, :flash =>{:success => 'O prato foi desativado com sucesso.' } }
      format.json { head :no_content }
    end
  end

  def daily_menu
    @plate = Plate.find(params[:plate_id])
    set_relations

    keys = ['sunday_available', 'monday_available', 'tuesday_available', 'wednesday_available', 
      'thursday_available', 'friday_available', 'saturday_available', ]
    keys.each { |k| params['plate'].has_key?(k) ? '' : params['plate'][k] = 0 }
    params['plate'].delete(['price_mask'])

    respond_to do |format|
      if @plate.update(plate_params)
        format.html { redirect_to :back, :flash =>{:success => 'O prato foi atualizado com sucesso.' } }
        format.json { render :show, status: :ok, location: @plate }
      else
        format.html { redirect_to :back, :flash =>{:alert => 'Erro ao salvar o Cardápio do Dia'} }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  def nutritional_table
    @plate = Plate.find(params[:plate_id])
    respond_to do |format|
      if @plate.nutritional_table.nil?
        @nutritional_table = NutritionalTable.create(nutritional_table_params)
        @plate.nutritional_table = @nutritional_table
        @plate.save
        format.html { redirect_to :back, :flash =>{:success => 'A tabela nutricional foi atualizada com sucesso.' } }
        format.json { render :show, status: :ok, location: @plate }
      else
        @plate.nutritional_table.update(nutritional_table_params)
        format.html { redirect_to :back, :flash =>{:success => 'O tabela nutricional foi atualizada com sucesso.' } }
        format.json { render :show, status: :ok, location: @plate }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
      set_relations
    end

    def set_relations
      @types = PlateType.all
      @badges = PlateBadge.all
      @chefs = Chef.all
      @ingredients_list = Ingredient.all.map { |i| {text: i.name, value: i.id}}
      @plate_ingredients_list = @plate.ingredients.map { |i| {text: i.name, value: i.id} }
      @accompaniments_list = PlateAccompaniment.all.map { |p| {text: p.name, value: p.id}}
      @plate_accompaniments_list = @plate.plate_accompaniments.map { |p| {text: p.name, value: p.id} }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_params
      params.require(:plate).permit(:nutritional_table, :title, :description, :price, :available_quantity, :photo, :active, :chef_id, :plate_type_id, 
        :ingredients_id, :plate_accompaniment_id, :sunday_available, :monday_available, :tuesday_available, :wednesday_available,
        :thursday_available, :friday_available, :saturday_available, :plate_badge_ids => [], :ingredient_ids => [], :plate_accompaniment_ids => [],
        )
    end

    def nutritional_table_params
      params.require(:nutritional_table).permit(:energetic_value, :carbohydrate, :protein, :total_fat, :saturated_fat, :trans_fat, :dietary_fiber, :sodium, :iron)
    end

    def plate_params_with_ingredients_and_accompaniments
      ingredient_ids = plate_params['ingredient_ids'][0].split(',')
      plate_accompaniment_ids = plate_params['plate_accompaniment_ids'][0].split(',')
      params = plate_params
      params['ingredient_ids'] = ingredient_ids
      params['plate_accompaniment_ids'] = plate_accompaniment_ids
      return params
    end
end
