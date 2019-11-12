#Este modelo (tabla) tiene una relación muchos a muchos con product
class Order < ApplicationRecord
  #Relaciones con las demás tablas. 
  belongs_to :product
  belongs_to :sell  

  
end 
