class Product < ActiveRecord::Base
  attr_accessible :code, :name, :description, :notes, :price

  validates :name, :presence => true
end
