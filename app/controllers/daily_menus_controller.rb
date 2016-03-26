class DailyMenusController < ApplicationController
  before_action :set_daily_menu, only: [:show, :edit, :update, :destroy]

  # GET /daily_menus
  # GET /daily_menus.json
  def index
    @daily_menus = DailyMenu.all
  end

  # GET /daily_menus/1
  # GET /daily_menus/1.json
  def show
  end

  # GET /daily_menus/new
  def new
    @daily_menu = DailyMenu.new
  end

  # GET /daily_menus/1/edit
  def edit
  end

  # POST /daily_menus
  # POST /daily_menus.json
  def create
    @daily_menu = DailyMenu.new(daily_menu_params)

    respond_to do |format|
      if @daily_menu.save
        format.html { redirect_to @daily_menu, notice: 'Daily menu was successfully created.' }
        format.json { render :show, status: :created, location: @daily_menu }
      else
        format.html { render :new }
        format.json { render json: @daily_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_menus/1
  # PATCH/PUT /daily_menus/1.json
  def update
    respond_to do |format|
      if @daily_menu.update(daily_menu_params)
        format.html { redirect_to @daily_menu, notice: 'Daily menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_menu }
      else
        format.html { render :edit }
        format.json { render json: @daily_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_menus/1
  # DELETE /daily_menus/1.json
  def destroy
    @daily_menu.destroy
    respond_to do |format|
      format.html { redirect_to daily_menus_url, notice: 'Daily menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_menu
      @daily_menu = DailyMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_menu_params
      params.fetch(:daily_menu, {})
    end
end
