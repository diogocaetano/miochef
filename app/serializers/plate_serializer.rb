class PlateSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :available_quantity, :photo, :active
  has_one :chef
  has_one :plate_type
  has_one :plate_badge
  has_one :ingredients
  has_one :plate_accompaniment
end
