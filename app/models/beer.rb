class Beer < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  validates :name, presence: true # A beer name must be supplied #
end
