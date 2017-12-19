class User < ActiveRecord::Base
  has_many :beers
  has_many :breweries
  
  has_secure_password
  
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
end
