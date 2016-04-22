class PlateRatingSerializer < ActiveModel::Serializer
  attributes :id, :score
  has_one :client
  has_one :plate
end
