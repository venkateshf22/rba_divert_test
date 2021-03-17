class AddOrderToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :order_id, :integer, foreign_key: true, index: true
    add_column :carts, :checked_out, :boolean, null: false, default: false
  end
end
