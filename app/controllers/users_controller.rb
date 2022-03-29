class UsersController < ApplicationController
  
  #before_action :authenticate_user!, except: [:new, :create]
  after_action :create_user_api_token, only: [:create]
  
  def show
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
     render json: "User saved"
    else
     render json: "User not saved"
    end
  end


  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password,:bio,:image)
  end

  def create_user_api_token
    user = User.find_by_email(params[:user][:email])
    user_token = User.generate_jwt_token(user[:id])
    user.update_attribute(:user_token,user_token)
  end
  
end