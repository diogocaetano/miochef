class NutritionalTablesController < ApplicationController
  before_action :set_nutritional_table, only: [:show, :edit, :update, :destroy]

  # GET /nutritional_tables
  # GET /nutritional_tables.json
  def index
    @term = params[:term]
    @where = []    
    @where << "nutritional_tables.energetic_value LIKE :term"
    @where << "nutritional_tables.carbohydrate LIKE :term"
    @where << "nutritional_tables.protein LIKE :term"
    @where << "nutritional_tables.total_fat LIKE :term"
    @where << "nutritional_tables.saturated_fat LIKE :term"
    @where << "nutritional_tables.trans_fat LIKE :term"
    @where << "nutritional_tables.dietary_fiber LIKE :term"
    @where << "nutritional_tables.sodium LIKE :term"
    @where << "nutritional_tables.iron LIKE :term"
    @where = @where.join(" OR ")
    @nutritional_tables = NutritionalTable.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /nutritional_tables/1
  # GET /nutritional_tables/1.json
  def show
  end

  # GET /nutritional_tables/new
  def new
    @nutritional_table = NutritionalTable.new
  end

  # GET /nutritional_tables/1/edit
  def edit
  end

  # POST /nutritional_tables
  # POST /nutritional_tables.json
  def create
    @nutritional_table = NutritionalTable.new(nutritional_table_params)

    respond_to do |format|
      if @nutritional_table.save
        format.html { redirect_to @nutritional_table, notice: 'Tabela Nutricional foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @nutritional_table }
      else
        format.html { render :new }
        format.json { render json: @nutritional_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutritional_tables/1
  # PATCH/PUT /nutritional_tables/1.json
  def update
    respond_to do |format|
      if @nutritional_table.update(nutritional_table_params)
        format.html { redirect_to @nutritional_table, notice: 'Tabela Nutricional foi removida com sucesso.' }
        format.json { render :show, status: :ok, location: @nutritional_table }
      else
        format.html { render :edit }
        format.json { render json: @nutritional_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutritional_tables/1
  # DELETE /nutritional_tables/1.json
  def destroy
    @nutritional_table.destroy
    respond_to do |format|
      if not @nutritional_table.errors.any?
        format.html { redirect_to nutritional_tables_url, notice: 'Tabela Nutricional removida com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to nutritional_tables_url, alert: @nutritional_table.errors.full_messages.join('<br>') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutritional_table
      @nutritional_table = NutritionalTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nutritional_table_params
      params.require(:nutritional_table).permit(:energetic_value, :carbohydrate, :protein, :total_fat, :saturated_fat, :trans_fat, :dietary_fiber, :sodium, :iron)
    end
end
