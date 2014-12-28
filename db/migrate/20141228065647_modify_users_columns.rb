class ModifyUsersColumns < ActiveRecord::Migration
  def change
    remove_column :users, :failed_attempts,   :integer
    remove_column :users, :unlock_token,      :string
    remove_column :users, :locked_at,         :datetime
    remove_column :users, :password_salt,     :string
    add_column    :users, :unconfirmed_email, :string
    add_column    :users, :reset_password_sent_at, :string

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
