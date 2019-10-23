#Este modelo se creó de la relación muchos a muchos entre
#las tablas product y order
class Sell < ApplicationRecord
    #Relación con las demás tablas.
    has_many :orders
    has_many :products, through: :orders

    #Validar que los siguientes campos deben existir sí o sí para poder guardar una venta
    validates_presence_of :sell_date, :total
end
