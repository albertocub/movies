class PeliculasController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  	#@peliculas = Pelicula.all
    @peliculas = Pelicula.order("#{sort_column} #{sort_direction}")
  end
  def show
  	@pelicula = Pelicula.find(params[:id]) 
  end 
  def new
    @pelicula = Pelicula.new  
  end
  def create
    @pelicula = Pelicula.new(pelicula_params)
    if @pelicula.save 
      flash[:danger] = t('flash.message2')
      redirect_to peliculas_path
    else
      render 'new'
    end
  end
  def edit
    @pelicula = Pelicula.find(params[:id])
  end
  def update
    @pelicula = Pelicula.find(params[:id])
    if @pelicula.update_attributes(pelicula_params)
      redirect_to peliculas_path
    else
      render :edit
    end
  end
  def destroy
     @pelicula = Pelicula.find(params[:id])
     @pelicula.destroy
     redirect_to peliculas_path
  end
  private
  def pelicula_params
    params.require(:pelicula).permit(:name, :director, :actor, :email_contact,
    :oscar, :category, :stars, :country, :year, :revenue_amount, :url, :genre, :precio, :movie_main)
  end  
  def sortable_columns
    ["id","name","actor","year"]
  end
  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end