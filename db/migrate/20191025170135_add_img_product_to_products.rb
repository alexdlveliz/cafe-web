class AddImgProductToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :imgProduct, :text
  end
end
