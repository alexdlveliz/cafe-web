class Sell < ApplicationRecord
    has_many :orders
    has_many :products, through: :orders

    validates_presence_of :sell_date, :total
end
