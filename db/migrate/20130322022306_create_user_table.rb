class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :dob
      t.string :password, :null => false
      t.integer :role, :default => 1
    end
  end
end
