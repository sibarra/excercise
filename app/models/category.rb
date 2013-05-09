class Category < ActiveRecord::Base
  attr_accessible :name, :exclusive
  has_many :subcategories

  validates :name, :presence => true
end
