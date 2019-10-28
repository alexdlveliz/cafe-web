module ProductsHelper
    def image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"
    end

    def product_img img, type
        if img.model.imgProduct?
            img
        elsif type == 'imgProduct'
            image_generator(height: '300', width: '300')
        end
    end
end
