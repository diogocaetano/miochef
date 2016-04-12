class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  def index    
    @term = params[:term]
    @where = []
    
    @where << "settings" + '.' + "key" + ' LIKE :term' 
    
    @where << "settings" + '.' + "name" + ' LIKE :term' 
    
    @where << "settings" + '.' + "value" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @settings = Setting.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @settings = Setting.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /settings/1
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to settings_path, :flash =>{:success => 'Configuração foi criada com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to settings_path, :flash =>{:success => 'Configuração foi atualizada com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    redirect_to settings_path, :flash =>{:success => 'Configuração foi removida com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:key, :name, :value)
    end
end
