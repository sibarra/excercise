class Category < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :exclusive
  has_many :subcategories
  has_many :products

  validates :name, :presence => true

  friendly_id :name, :use => :slugged
end
