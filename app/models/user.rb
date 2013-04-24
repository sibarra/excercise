class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :dob, :password

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => { :in => 6..20 }
end
