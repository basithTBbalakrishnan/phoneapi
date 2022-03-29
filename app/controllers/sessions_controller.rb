class SessionsController < Devise::SessionsController
  
  def create
    puts"=====params====="+params[:email].inspect
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      puts"success when login" 
      @current_user = user
      @current_user_token = user[:user_token]
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end