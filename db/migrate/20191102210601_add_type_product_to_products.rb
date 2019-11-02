class AddTypeProductToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :type_product, :integer
  end
end
