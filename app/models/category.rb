class Category < ActiveRecord::Base
  attr_accessible :name, :exclusive

  validates :name, :presence => true
end
