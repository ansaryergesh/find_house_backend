# frozen_string_literal: true

class User < ApplicationRecord
  has_many :homes, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :favourites, dependent: :destroy
end
