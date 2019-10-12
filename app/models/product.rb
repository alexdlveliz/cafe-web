class Product < ApplicationRecord
    has_many :orders
    has_many :sells, through: :orders
end
