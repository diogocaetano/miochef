class ChefRatingSerializer < ActiveModel::Serializer
  attributes :id, :score
  has_one :client
  has_one :chef
end
