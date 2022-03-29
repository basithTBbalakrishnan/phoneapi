class CreatePhonenumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phonenumbers do |t|
      t.integer :user_id
      t.integer :phonenumber

      t.timestamps
    end
  end
end
