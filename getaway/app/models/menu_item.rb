class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :visit_menu_item


  def self.find_menu_item(restaurant_id)
    MenuItem.where(restaurant_id: restaurant_id)
  end
end
