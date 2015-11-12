class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    if current_user.is_dev
      return @roles = Role.all
    end
    @roles = Role.where.not(id: 1).collect {|role| role }
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
        format.html { redirect_to @role, notice: 'Perfil Criado com Sucesso.' }
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
        format.html { redirect_to @role, notice: 'Perfil Atualizado com Sucesso.' }
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
      format.html { redirect_to roles_url, notice: 'Perfil Removido com Sucesso.' }
      format.json { head :no_content }
    end
  rescue
    respond_to do |format|
      format.html { redirect_to roles_url, alert: 'O Perfil não pode ser excluído. Existem associações ao registro.' }
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
