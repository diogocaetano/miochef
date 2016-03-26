class ChefTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :chef
end
