class Subcategory < ActiveRecord::Base
  extend FriendlyId
  belongs_to :category
  has_many :products
  attr_accessible :name, :category_id, :order

  validates :name, :presence => true
  validates_presence_of :category

  friendly_id :name, :use => :slugged
end
