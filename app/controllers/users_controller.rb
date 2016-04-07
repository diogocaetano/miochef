class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @term = params[:term]
    @where = []    
    @where << "users.name LIKE :term"     
    @where << "roles.name LIKE :term"     
    @where << "users.email LIKE :term"    
    @where = @where.join(" OR ")
    if current_user.is_dev
      if params[:term].present?
        return @users = User.joins(:role).where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
      else
        return @users = User.all.paginate(:page => params[:page], :per_page => 10)
      end
    else
      if params[:term].present?
        @users = User.joins(:role).where.not(id: 1).where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
      else
        @users = User.where.not(id: 1).paginate(:page => params[:page], :per_page => 10)
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_admin_index_path, :flash =>{:success => 'O usuário foi criado com sucesso.' } } 
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_admin_index_path, :flash =>{:success => 'O usuário foi atualizado com sucesso.' } } 
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_admin_index_path, :flash =>{:success => 'O Usuário foi removido com sucesso.' } } 
      format.json { head :no_content }
    end
  rescue
    respond_to do |format|
      format.html { redirect_to users_admin_index_path, :flash =>{:danger =>  'O Usuário não foi removido. Existem associações para o registro.' } }
      format.json { head :no_content }
    end
  end

  def update_password
    @user = User.find(params['user'][:id])
    if @user.update_with_password(user_params)
      if @user.id == current_user.id 
        sign_in @user, :bypass => true
      end
      flash[:success] = "Senha alterada com sucesso"
      redirect_to :back
    else
      flash[:danger] = "Erro ao editar senha"
      redirect_to :back
    end
  end

  def update_all_passwords
    update_password
  end

  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role_id, :name, :is_admin, :is_representative, :email, :password, :password_confirmation, :current_password)
    end
end
