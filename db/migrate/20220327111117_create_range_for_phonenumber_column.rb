class CreateRangeForPhonenumberColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :phonenumbers, :phonenumber, :integer, limit: 8
  end
end
