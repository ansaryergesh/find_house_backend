# frozen_string_literal: true

# Favourite Serializer
class FavouriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :home_id
end
