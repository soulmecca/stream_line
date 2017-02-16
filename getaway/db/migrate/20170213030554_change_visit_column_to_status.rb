class ChangeVisitColumnToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :visits, :drop, :status
  end
end
