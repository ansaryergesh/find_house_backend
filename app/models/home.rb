class Home < ApplicationRecord
  belongs_to :user
  validates_presence_of :name,:descripton, :price
end
