#Crear 25 productos de prueba
14.times do |product|    
    Product.create!(
        name: "Product #{product}", 
        price: rand(1.5...50.50).round(2),
        description: "Product #{product} description",
        imgProduct: "http://placehold.it/300x300",
        type_product: 0
    )
end

15.times do |product|    
    Product.create!(
        name: "Product #{(product+15)}", 
        price: rand(1.5...50.50).round(2),
        description: "Product #{(product+15)} description",
        imgProduct: "http://placehold.it/300x300",
        type_product: 1
    )
end

puts "25 products created"

#Crear 9 eventos 
9.times do |event|
    Event.create!(
        name: "Evento #{event}",
        description: "Descripción para el evento #{event}",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200",
        date_event: Time.now.strftime("%d-%m-%Y %H:%M"),
        status: 0
    )
end

puts "9 events created"

#Crear 15 ventas de prueba
15.times do |sell|
    Sell.create!(
        sell_date: Time.now,
        total: 0.0
    )
    Sell.last.products << Product.first
    Sell.last.products << Product.last
    Sell.last.orders.first.update_attributes(quantity: 1)
    Sell.last.orders.last.update_attributes(quantity: 1)
    Sell.last.update!(total: Sell.last.total + (Sell.last.products.first.price*Sell.last.orders.first.quantity))
    Sell.last.update!(total: Sell.last.total + (Sell.last.products.last.price*Sell.last.orders.last.quantity))
end

puts "15 sells created"
