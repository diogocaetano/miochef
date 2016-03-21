class AddressSerializer < ActiveModel::Serializer
  attributes :id, :public_place, :number, :neighborhood, :city, :state, :zip_code, :complement
  has_one :chef
end
