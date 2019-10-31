class ChangeSellDateToBeTimestampInSells < ActiveRecord::Migration[5.2]
  def up
    change_column :sells, :sell_date, :timestamp    
  end

  def down
    change_column :sells, :sell_date, :date
  end
end
