class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.text :main_image
      t.text :thumb_image
      t.date :date_event

      t.timestamps
    end
  end
end
