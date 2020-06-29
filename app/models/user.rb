# frozen_string_literal: true

class User < ApplicationRecord
  has_many :homes, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :favourites, dependent: :destroy
  scope :favorited_by, ->(username) { joins(:favorites).where(favorites:
    { user: User.where(username: username) }) }
end
