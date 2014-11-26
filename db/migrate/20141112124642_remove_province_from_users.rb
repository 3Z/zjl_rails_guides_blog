class RemoveProvinceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :city, :integer
  end
end
