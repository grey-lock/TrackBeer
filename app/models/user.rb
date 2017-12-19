class User < ActiveRecord::Base
  has_many :beers
  has_many :breweries, through: :beers # Users can have favorite breweries that they can add through the beers they like
  
  has_secure_password
  
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 4 } # TODO: Add a regex? to validate the emails with @ and more.
  validates :password_digest, presence: true, length: { minimum: 6 } # TODO: Enforce stronger pass security such as have symbol/number
end
