class Phonenumber < ApplicationRecord
  before_save :validate_user_phonenumber  

  belongs_to :user
   
  validates :phonenumber, presence: true, uniqueness: true    
   
  def validate_user_phonenumber  
    check_number_is_in_range 
  end
    
  def check_number_is_in_range
     self.phonenumber.between?(1111111111,9999999999)   
     select_a_random_number_from_the_range unless self.phonenumber.between?(1111111111,9999999999)  
  end
  
  def select_a_random_number_from_the_range
    random_number = Random.new.rand(1111111111..9999999999)   
    check_user_number_already_exists random_number
  end
  
  def check_user_number_already_exists random_number
    user_phonenumbers = Phonenumber.pluck(:phonenumber)
   if user_phonenumbers.include?(random_number)
    select_a_random_number_from_the_range
   else
   self.phonenumber = random_number
   end 
  end
      
end
