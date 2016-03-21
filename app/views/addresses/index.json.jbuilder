json.array!(@addresses) do |address|
  json.extract! address, :id, :chef_id, :public_place, :number, :neighborhood, :city, :state, :zip_code, :complement
  json.url address_url(address, format: :json)
end
