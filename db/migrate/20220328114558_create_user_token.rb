class CreateUserToken < ActiveRecord::Migration[6.0]
  def change
   add_column :users, :user_token, :string
  end
end
