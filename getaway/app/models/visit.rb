class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :visit_menu_items

  enum status: [:waiting, :sat, :canceled]

  def self.current_waiting(user_id)
    Visit.where("user_id = ? AND status = ?", user_id, 0)[0]  
  end

  def self.create_visit(user_id, restaurant_id) 
    Visit.create({user_id: user_id, restaurant_id: restaurant_id})
  end

end


