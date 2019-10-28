#Este modelo (tabla) tiene una relación muchos a muchos con product
class Order < ApplicationRecord
  #Relaciones con las demás tablas. 
  belongs_to :product, optional: true
  belongs_to :sell, optional: true

  #Validar la presencia obligatoria del precio y de la cantidad
  validates_presence_of :price, :quantity
end
