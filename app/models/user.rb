class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :dob, :password
  before_create :encrypt_password
  before_save { |user| user.email = user.email.downcase }
  has_many :products

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, uniqueness: { case_sensitive: false }
  validates :password, :presence => true, :length => { :minimum => 6, :maximum => 100 }

  def self.authenticate(email, password)
    user = find_by_email(email)
    print user
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
