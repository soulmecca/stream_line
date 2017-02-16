class RemoveVisitMenuItemIdFromMenuItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :menu_items, :visit_menu_item_id
  end
end
