#Este modelo (tabla) tiene una relación muchos a muchos con order
class Product < ApplicationRecord
    #Relación con las demás tablas
    has_many :orders
    has_many :sells, through: :orders

    #Validar que los siguientes campos estén sí o sí al momento de agregar un nuevo producto
    validates_presence_of :name, :price, :description

    #Uploader para poner las imágenes desde AWS
    mount_uploader :imgProduct, ProductUploader
end
