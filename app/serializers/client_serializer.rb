class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :cep
end
