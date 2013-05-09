class AddSubcategory < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string  :name, :null => false
      t.integer :category_id, :null => false
      t.integer :order, :default => 1
    end
  end
end
