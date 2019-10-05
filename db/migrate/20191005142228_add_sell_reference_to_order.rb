class AddSellReferenceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :sell, foreign_key: true
  end
end
