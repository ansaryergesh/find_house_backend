class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :created_at
end
