class Setting < ApplicationRecord
  
  belongs_to :user

  # validates :name, presence: {message: :no_name}
  validates :country, presence: true
  validates :language , presence: true
  validates :country, length: {minimum: 2, message: "El Pais debe tener 2 caracteres como minimo!! "}
  validates :language, length: {minimum: 2, message: "El Idioma debe de tener 2 caracteres como minimo!! "} 
  
end
