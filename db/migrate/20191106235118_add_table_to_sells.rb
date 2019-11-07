class AddTableToSells < ActiveRecord::Migration[5.2]
  def change
    add_column :sells, :table, :integer
  end
end
