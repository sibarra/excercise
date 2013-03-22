class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :dob

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
end
