class Product < ActiveRecord::Base
  attr_accessible :code, :name, :description, :notes, :price, :image
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"

  validates :name, :presence => true
  validates :price, :numericality => true
  validates_attachment :image, :size => { :in =>  0..5.megabytes }
  validates_attachment_content_type :image, :content_type => [ 'image/jpeg', 'image/png' ]
end
