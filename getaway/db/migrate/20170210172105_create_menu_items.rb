class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :price
      t.integer :restaurant_id
      t.integer :visit_menu_item_id

      t.timestamps
    end
  end
end
