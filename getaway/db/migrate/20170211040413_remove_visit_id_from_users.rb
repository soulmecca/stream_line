class RemoveVisitIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :visit_id
  end
end
