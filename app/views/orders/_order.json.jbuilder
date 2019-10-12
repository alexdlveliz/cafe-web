json.extract! order, :id, :price, :quantity, :product_id, :sell_id, :created_at, :updated_at
json.url order_url(order, format: :json)
