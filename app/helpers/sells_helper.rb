module SellsHelper
    def products_drinks
        Product.all.where(type_product: 0).pluck(:name, :id)
    end

    def products_food
        Product.all.where(type_product: 1).pluck(:name, :id)
    end
end
