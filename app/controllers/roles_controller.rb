class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @term = params[:term]
    if current_user.is_dev
      Role.where('name LIKE ?', "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
      return @roles = Role.all.paginate(:page => params[:page], :per_page => 10)
    end
    @roles = Role.where.not(id: 1).where('name LIKE ?', "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @role.permission_ids = params[:permission_ids]
    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_url, :flash =>{:success => 'O perfil foi atualizado com sucesso.' } } 
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @role.permission_ids = params[:permission_ids]
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_url, :flash =>{:success => 'O perfil foi atualizado com sucesso.' } } 
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, :flash =>{:success => 'O perfil foi atualizado com sucesso.' } } 
      format.json { head :no_content }
    end
  rescue
    respond_to do |format|
      format.html { redirect_to roles_url, :flash =>{:danger => 'O Perfil não pode ser excluído. Existem associações ao registro.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, { :permission_ids => [] })
    end
end
