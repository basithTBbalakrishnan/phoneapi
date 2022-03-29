class PhonenumbersController < ApplicationController
 
 before_action :authenticate_user
 
 
 def index
  
 end

 def show
    
 end

 def edit
   
 end

 def create
  phonenumber = Phonenumber.new(phonenumber_params)
  if phonenumber.save
     render json: "user phonenumber saved succesfully."
  else   
     render json: "Invalid phonenumber."
  end 
 end

 def update
   
 end

 def destroy
   
 end

 private
 
 def phonenumber_params
   params.require(:phonenumber).permit(:phonenumber,:user_id)   
 end

end
