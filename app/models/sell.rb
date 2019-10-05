class Sell < ApplicationRecord
    validates_presence_of :date_sell, :total
end
