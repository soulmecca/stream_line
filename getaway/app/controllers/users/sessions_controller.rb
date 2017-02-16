class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # def after_sign_up_path_for(resource)
  #   case resource
  #   when :user, User
  #     resource.teacher? ? another_path : root_path
  #   else
  #     super
  #   end
  # end  

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    # super
    # raise Visit.where(user_id: current_user.id  status: 'waiting').inspect
    @visit = Visit.where("user_id = ? AND status = ?", current_user.id, 0)
    @visit[0].update(status: 2) if @visit[0]
      
    reset_session
    cookies[:user_id] = nil
    cookies[:user_name] = nil
    redirect_to "/login/#{params[:id]}"
  end

  def after_login
    @restaurant = Restaurant.find(params[:id])
    cookies[:user_id] = current_user.id
    cookies[:user_name] = current_user.name

    if !current_user || !@restaurant
      puts '###### INSIDE IF'
      redirect_to(:back)
    else
      puts '###### INSIDE ELSE '
      if current_user.account_type == 'owner'
          redirect_to restaurant_path(@restaurant)
      else
        redirect_to "/restaurants/#{params[:id]}/users/#{current_user.id}"
      end      
    end

  end

end
