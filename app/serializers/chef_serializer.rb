class ChefSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cpf, :rg, :born_date, :email, :phone_one, :phone_two, :specialty, :naturalness, :academic_education, :university
  has_one :country
end
