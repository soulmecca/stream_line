class RestaurantsController < ApplicationController

  def show

    if user_signed_in?
      @current_user = current_user
      @restaurant = Restaurant.find_restaurant(params[:id])
      @waiting_list = @restaurant.current_wating_list      

      # showing the orders from the customer  
      if params[:user_id]
        @visit = Visit.current_waiting(params[:user_id])
        @orders = VisitMenuItem.find_orders(@visit.id)
        @total_price = @orders.inject(0) {|total, menu| total + menu.menu_item.price}
      end    
 
    else
      redirect_to "/login/#{parmas[:id]}"
    end    

    respond_to :html, :js 

  end

end
