class UsersController < ApplicationController

  # getting orders from user
  def new
    @visit = Visit.current_waiting(current_user.id)

    if @visit && params[:orders]
      params[:orders].each do |order|
        VisitMenuItem.create_visit_item(@visit.id, order.to_i) 
      end
    end

    @visit = nil
    redirect_to(:back)
  end


  def show
    if user_signed_in?
      
      @restaurant = Restaurant.find_restaurant(params[:restaurant_id])
      @user = current_user
      @menu_items = MenuItem.find_menu_item(params[:restaurant_id])

      if !(session[:waiting] == true)
        @visit = Visit.create_visit(current_user.id, params[:restaurant_id])
        session[:waiting] = true
      else
        @visit = Visit.current_waiting(current_user.id)
      end

      respond_to :html, :js
      
    else
      redirect_to "login/#{parmas[:restaurant_id]}"
    end
  end


  # def create
  #   @user = User.create(user_params)
  #     redirect_to '/login/1'
  # end


  # to display order to the restaurant's owner
  def order
    @visit = Visit.current_waiting(params[:id])

    if @visit
      @orders = VisitMenuItem.find_orders(@visit.id)
      render :layout => false
    end
  end


private

  # def user_params
  #   params.require(:user).permit(:username, :name, :password, :account_type)
  # end
end