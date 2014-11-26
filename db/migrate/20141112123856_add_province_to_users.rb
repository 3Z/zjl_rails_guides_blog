class AddProvinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :province, :integer
  end
end
