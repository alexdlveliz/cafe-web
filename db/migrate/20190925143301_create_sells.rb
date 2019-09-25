class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.date :date_sell
      t.float :total

      t.timestamps
    end
  end
end
