# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :created_at
end
