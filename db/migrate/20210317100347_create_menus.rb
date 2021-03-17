class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :price
      t.timestamps
    end
  end
end
