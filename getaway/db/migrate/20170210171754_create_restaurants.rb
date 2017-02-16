class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :user_id

      t.timestamps "created_at"
      t.timestamps "updated_at"
    end
  end
end
