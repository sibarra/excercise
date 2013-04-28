class AddUserPasswordSalt < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :text
  end
end
