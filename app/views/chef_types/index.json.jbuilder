json.array!(@chef_types) do |chef_type|
  json.extract! chef_type, :id, :chef_id, :name
  json.url chef_type_url(chef_type, format: :json)
end
