json.array!(@plate_types) do |plate_type|
  json.extract! plate_type, :id, :name
  json.url plate_type_url(plate_type, format: :json)
end
