class AddCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :integer
  end
end