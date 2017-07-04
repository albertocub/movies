class AddColumnasToPeliculas < ActiveRecord::Migration[5.0]
  def change
  rename_column :peliculas, :main_actor, :actor
  add_column :peliculas, :url, :text
  add_column :peliculas, :oscar, :boolean
  add_column :peliculas, :category, :string
  add_column :peliculas, :director, :string
  add_column :peliculas, :country, :string
  add_column :peliculas, :revenue_amount, :integer
  add_column :peliculas, :genre, :string
  add_column :peliculas, :precio, :integer
  end
end
