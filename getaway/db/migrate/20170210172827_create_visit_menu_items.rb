class CreateVisitMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :visit_menu_items do |t|
      t.integer :visit_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
