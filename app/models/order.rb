class Order < ApplicationRecord
    validates_presence_of :price, :quantity
    
    belongs_to :sell
end
