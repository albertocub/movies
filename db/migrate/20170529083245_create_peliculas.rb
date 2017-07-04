class CreatePeliculas < ActiveRecord::Migration[5.0]
  def change
    create_table :peliculas do |t|
      t.string :name
      t.integer :stars
      t.string :actor
      t.integer :year
 	    t.text :url
      t.string :email_contact
      t.boolean :oscar
      t.string :category
      t.string :director
      t.string :country
      t.integer :revenue_amount
      t.string :genre
      t.integer :precio
      t.timestamps
    end
  end
end
