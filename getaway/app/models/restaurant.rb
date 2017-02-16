class Restaurant < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :visits
  has_many :menu_items

  def self.find_restaurant(id)
    Restaurant.find(id)
  end

  def current_wating_list
    @list = self.visits.where(status: 'waiting')
  end
end
