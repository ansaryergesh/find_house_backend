class User < ApplicationRecord
    has_many :houses, foreign_key: :created_by
    has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end
