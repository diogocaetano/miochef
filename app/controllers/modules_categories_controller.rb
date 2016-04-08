class ModulesCategoriesController < ApplicationController
  before_action :set_modules_category, only: [:show, :edit, :update, :destroy]

  # GET /modules_categories
  # GET /modules_categories.json
  def index
    @term = params[:term]
    @where = []    
    @where << "modules_categories.name LIKE :term"
    @where = @where.join(" OR ")
    @modules_categories = ModulesCategory.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /modules_categories/1
  # GET /modules_categories/1.json
  def show
  end

  # GET /modules_categories/new
  def new
    @modules_category = ModulesCategory.new
  end

  # GET /modules_categories/1/edit
  def edit
  end

  # POST /modules_categories
  # POST /modules_categories.json
  def create
    @modules_category = ModulesCategory.new(modules_category_params)

    respond_to do |format|
      if @modules_category.save
        format.html { redirect_to modules_categories_url, notice: 'Categoria de Módulos criada com sucesso.' }
        format.json { render :show, status: :created, location: @modules_category }
      else
        format.html { render :new }
        format.json { render json: @modules_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modules_categories/1
  # PATCH/PUT /modules_categories/1.json
  def update
    respond_to do |format|
      if @modules_category.update(modules_category_params)
        format.html { redirect_to modules_categories_url, notice: 'Categoria de Módulos atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @modules_category }
      else
        format.html { render :edit }
        format.json { render json: @modules_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modules_categories/1
  # DELETE /modules_categories/1.json
  def destroy
    @modules_category.destroy
    respond_to do |format|
      format.html { redirect_to modules_categories_url, notice: 'Categoria de Módulos removida com sucesso.' }
      format.json { head :no_content }
    end
  rescue
    respond_to do |format|
      format.html { redirect_to modules_categories_url, notice: 'Categoria de Módulos não foi removida. Existem associações ao registro.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modules_category
      @modules_category = ModulesCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modules_category_params
      params.require(:modules_category).permit(:name, :icon)
    end
end
