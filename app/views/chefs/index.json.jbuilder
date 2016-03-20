json.array!(@chefs) do |chef|
  json.extract! chef, :id, :name, :description, :cpf, :rg, :born_date, :country_id, :email, :phone_one, :phone_two, :specialty, :naturalness, :academic_education, :university
  json.url chef_url(chef, format: :json)
end
