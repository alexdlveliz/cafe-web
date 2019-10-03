25.times do |product|
    Product.create!(
        name: "Product #{product}", 
        price: rand(1.5...50.50),
        description: "Product #{product} description"
    )
end
puts "25 products created"


5.times do |order|
    Order.create!(
        price: rand(15.50...150.50),
        quantity: (order+1)
    )
end

puts "5 orders created"

5.times do |sell|
    Sell.create!(
        date_sell: Time.now.to_formatted_s(:date), 
        total: rand(150.50...500.00)
    )
end

puts "5 sells created"