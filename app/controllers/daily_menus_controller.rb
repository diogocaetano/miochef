class DailyMenusController < ApplicationController
  before_action :set_daily_menu, only: [:show, :edit, :update, :destroy]

  # GET /daily_menus
  # GET /daily_menus.json
  def index
    @daily_menus = DailyMenu.all.paginate(:page => params[:page], :per_page => 10)
    #@plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1)

    @term = params[:term]
    @where = []    
    @where << "plates.title LIKE :term"
    @where = @where.join(" OR ")
    @plates = Plate.where(active: 1).where(get_today_plate_tag(Date.today.wday).to_s, 1).where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
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
        format.html { redirect_to daily_menus_url, :flash =>{:success => 'O menu diário foi criado com sucesso.' } } 
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
        format.html { redirect_to daily_menus_url, :flash =>{:success => 'O menu diário foi atualizado com sucesso.' } } 
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
      format.html { redirect_to daily_menus_url, :flash =>{:success => 'O menu diário foi removido com sucesso.' } } 
      format.json { head :no_content }
    end
  end

  def get_plates_from_date
    date = Date.parse(params['date'])
    request_id = params['request_id']
    @plates = Plate.where(active: 1).where(get_today_plate_tag(date.wday).to_s, 1)
    @plates.each do |p|
      plate_request = RequestPlate::where(request_id: request_id.to_s).where(plate_id: p.id.to_s).first
      if not plate_request.nil?
        p.quantity = plate_request.quantity
      else
        p.quantity = 0
      end
    end

    respond_to do |format|
      format.html { render json: @plates.collect{ |plate| [ plate.title, plate.price, plate.id, plate.quantity ] } }
      format.json { render json: @plates.collect{ |plate| [ plate.title, plate.price, plate.id, plate.quantity ] } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_menu
      @daily_menu = DailyMenu.find(params[:id])
    end

    def get_today_plate_tag day
      tags = [:sunday_available, :monday_available, :tuesday_available, :wednesday_available,
        :thursday_available, :friday_available, :saturday_available]
      tags[day]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_menu_params
      params.fetch(:daily_menu, {})
    end
end
