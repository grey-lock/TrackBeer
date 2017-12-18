class Beer < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  validates :name, presence: true
end
