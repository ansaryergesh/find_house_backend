class HomeSerializer < ActiveModel::Serializer
  attributes :id, :name, :descripton, :price, :created_at
end
