class Product < ApplicationRecord
    has_many :orders
    has_many :sells, through: :orders

    validates_presence_of :name, :price, :description
end
