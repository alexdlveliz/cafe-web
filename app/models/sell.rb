#Este modelo se creó de la relación muchos a muchos entre
#las tablas product y order
class Sell < ApplicationRecord
    #Relación con las demás tablas.
    has_many :orders
    has_many :products, through: :orders

    #Aceptar productos.
    #No acepte el producto si el campo nombre está vacío
    accepts_nested_attributes_for :products, 
                                    reject_if: lambda { |attrs| attrs['name'].blank? }

    #Validar que los siguientes campos deben existir sí o sí para poder guardar una venta
    validates_presence_of :sell_date
end
