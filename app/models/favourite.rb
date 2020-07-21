# frozen_string_literal: true

# Favourite model
class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :home
end
