class Sell < ApplicationRecord
    validates_presence_of :date_sell, :total
    
    has_many :orders
end
