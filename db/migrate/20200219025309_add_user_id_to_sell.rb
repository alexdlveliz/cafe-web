class AddUserIdToSell < ActiveRecord::Migration[5.2]
  def change
    add_reference :sells, :user, foreign_key: true
  end
end
