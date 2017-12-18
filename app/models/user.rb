class User < ActiveRecord::Base
  has_many :beers
  has_many :breweries
  
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
