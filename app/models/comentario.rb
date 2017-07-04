class Comentario < ApplicationRecord
	belongs_to :pelicula
	validates :name, presence: {message:" El nombre no puede estar vacio "}
	validates :comment, presence: {message:" El comentario no puede estar vacio "}
end
