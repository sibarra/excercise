class Category < ActiveRecord::Base
  attr_accessible :name, :exclusive
  has_many :subcategories
  has_many :products

  validates :name, :presence => true
end
