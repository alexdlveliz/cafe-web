#Crear 25 productos de prueba
25.times do |product|
    Product.create!(
        name: "Product #{product}", 
        price: rand(1.5...50.50),
        description: "Product #{product} description",
        imgProduct: "http://placehold.it/300x300"
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
        sell_date: Time.now.to_formatted_s(:date), 
        total: rand(150.50...500.00),
        products: [Product.first, Product.last]
    )
end

puts "15 sells created"
