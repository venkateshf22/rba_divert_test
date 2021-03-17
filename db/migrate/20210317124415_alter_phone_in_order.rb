class AlterPhoneInOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :phone, :integer, limit: 8
  end 
end
