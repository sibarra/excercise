class AddCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.boolean :exclusive, :null => false, :default => false
    end
  end
end
