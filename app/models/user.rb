class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable
        
 
 has_many :phonenumbers
       
 validates :email, presence: true, uniqueness: true        
          
 def generate_jwt
   puts'---------------'  
  JWT.encode({ id: id,
   exp: 60.days.from_now.to_i },
   Rails.application.secrets.secret_key_base)
 end
 
 
 def self.generate_jwt_token(user_id)
   puts'---------------'  
  token = JWT.encode({ id: user_id,
   exp: 60.days.from_now.to_i },
   Rails.application.secrets.secret_key_base)
   token
 end
 
end
