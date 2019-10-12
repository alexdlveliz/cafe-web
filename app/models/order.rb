class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :sell, optional: true
end
