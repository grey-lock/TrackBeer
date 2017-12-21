class Brewery < ActiveRecord::Base
  # Beers will have a brewery_id
  has_many :beers
  # belongs_to :user
  
  validates :name, presence: true
end
