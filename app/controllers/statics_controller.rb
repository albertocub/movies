class StaticsController < ApplicationController
	#skip_before_action :authenticate_user!
  def index
  	@peliculas = Pelicula.all
  	@comentarios = Comentario.all.order("created_at DESC").limit(6) 
    @busqueda=""
  	if params[:search]
  	 @peliculas = Pelicula.search(params[:search]) 
     @busqueda= "film:  "+params[:search]
   	elsif params[:search_year]
   	 @peliculas = Pelicula.search_year(params[:search_year]) 
     @busqueda= "year:  "+params[:search_year]
    end
    if params[:search_genre] == "ALL"
       @peliculas = Pelicula.all
    elsif params[:search_genre] 
       @peliculas = Pelicula.search_genre(params[:search_genre]).order("created_at DESC")
       @busqueda= "genre:  "+params[:search_genre] 
    end	 
  end
  def about
  end
end
