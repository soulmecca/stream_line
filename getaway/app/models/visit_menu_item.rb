class VisitMenuItem < ApplicationRecord
  belongs_to :visit
  belongs_to :menu_item

  def self.current_order_items(visit_id)
    VisitMenuItem.where(visit_id: visit_id)
  end

  def self.find_orders(visit_id)
    VisitMenuItem.where(visit_id: visit_id)
  end

  def self.create_visit_item(visit_id, menu_id)
    VisitMenuItem.create(visit_id: visit_id, menu_item_id: menu_id) 
  end

  def self.find_menu_item(restaurant_id)
    MenuItem.where(restaurant_id: restaurant_id)
  end
    

end
