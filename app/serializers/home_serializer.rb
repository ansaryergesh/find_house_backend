# frozen_string_literal: true

#Home Serializer
class HomeSerializer < ActiveModel::Serializer
  attributes :id, :name, :descripton, :price, :created_at
end
