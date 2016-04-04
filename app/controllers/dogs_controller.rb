

class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  def index    
    @term = params[:term]
    @where = []
    
    @where << "dogs" + '.' + "nome" + ' LIKE :term' 
    
    @where << "dogs" + '.' + "age" + ' LIKE :term' 
    
    @where = @where.join(" OR ")
    
    if params[:term].present?
      @dogs = Dog.where(@where, term: "%#{params[:term]}%").paginate(:page => params[:page], :per_page => 10)
    else
      @dogs = Dog.paginate(:page => params[:page], :per_page => 10)
    end
  
  end

  # GET /dogs/1
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dogs_path, :flash =>{:success => 'Dog foi criado com sucesso.' }
    else
      render :new
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      redirect_to dogs_path, :flash =>{:success => 'Dog foi atualizado com sucesso.' }
    else
      render :edit
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
    redirect_to dogs_path, :flash =>{:success => 'Dog foi removido com sucesso.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params

      params.require(:dog).permit(:nome, :age)

    end
end
