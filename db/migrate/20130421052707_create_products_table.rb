class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :code
      t.string  :name
      t.string  :description
      t.string  :notes
      t.float   :price
    end
  end
end
