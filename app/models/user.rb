# frozen_string_literal: true

class User < ApplicationRecord
  has_many :homes, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }
  validates_presence_of :username, :bio, :password
  has_secure_password

end
