class Brewery < ActiveRecord::Base
  has_many :beers
  belongs_to :user
  
  validates :name, presence: true
end
