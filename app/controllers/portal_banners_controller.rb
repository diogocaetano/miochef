class PortalBannersController < ApplicationController
  before_action :set_portal_banner, only: [:show, :edit, :update, :destroy]

  # GET /portal_banners
  def index    
    @term = params[:term]
    @where = []
    
    @where << "portal_banners" + '.' + "title" + ' LIKE :term' 
    
    @where << "portal_banners" + '.' + "image" + ' LIKE :term' 
    
    @where << "portal_banners" + '.' + "link" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @portal_banners = PortalBanner.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @portal_banners = PortalBanner.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /portal_banners/1
  def show
  end

  # GET /portal_banners/new
  def new
    @portal_banner = PortalBanner.new
  end

  # GET /portal_banners/1/edit
  def edit
  end

  # POST /portal_banners
  def create
    @portal_banner = PortalBanner.new(portal_banner_params)

    if @portal_banner.save
      redirect_to portal_banners_path, :flash =>{:success => 'Banner do Portal foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /portal_banners/1
  def update
    if @portal_banner.update(portal_banner_params)
      redirect_to portal_banners_path, :flash =>{:success => 'Banner do Portal foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /portal_banners/1
  def destroy
    @portal_banner.destroy
    redirect_to portal_banners_path, :flash =>{:success => 'Banner do Portal foi removido com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_banner
      @portal_banner = PortalBanner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portal_banner_params
      params.require(:portal_banner).permit(:title, :image, :link)
    end
end
