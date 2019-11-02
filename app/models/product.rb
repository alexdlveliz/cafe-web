#Este modelo (tabla) tiene una relación muchos a muchos con order
class Product < ApplicationRecord
    #Relación con las demás tablas
    has_many :orders
    has_many :sells, through: :orders

    #Validar que los siguientes campos estén sí o sí al momento de agregar un nuevo producto
    validates_presence_of :name, :price, :description
    #Validar que en el campo 'price' solo se puedan agregar precios válidos, no letras, números con un punto decimal.
    validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 1000}

    #Uploader para poner las imágenes desde AWS
    mount_uploader :imgProduct, ProductUploader
end
