class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.date :sell_date
      t.float :total

      t.timestamps
    end
  end
end
