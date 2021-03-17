class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true, index: true
      t.references :menu, foreign_key: true, index: true
      t.timestamps
    end
  end
end
