class ChangeDateEventToBeTimestampInEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :events, :date_event, :timestamp
  end

  def down
    change_column :events, date_event, :date
  end
end
