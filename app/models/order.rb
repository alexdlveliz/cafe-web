class Order < ApplicationRecord
    validates_presence_of :price, :quantity
end
