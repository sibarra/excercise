class AddSlugstoCategorySubcategory < ActiveRecord::Migration
  def change
    # Change to Category table
    add_column  :categories, :slug, :string
    add_index   :categories, :slug, unique: true

    #Change to Subcategory table
    add_column  :subcategories, :slug, :string
    add_index   :subcategories, :slug, unique: true
  end
end
