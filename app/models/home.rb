class Home < ApplicationRecord
  belongs_to :user
  validates_presence_of :name,:descripton, :price
  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }
end
