class AddMovieMainToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :movie_main, :string
  end
end
