json.array!(@plate_accompaniments) do |plate_accompaniment|
  json.extract! plate_accompaniment, :id, :name
  json.url plate_accompaniment_url(plate_accompaniment, format: :json)
end
