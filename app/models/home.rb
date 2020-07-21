# frozen_string_literal: true

# Home model
class Home < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :descripton, :price
  has_many :favourites, dependent: :destroy
end
