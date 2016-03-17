json.array!(@plates) do |plate|
  json.extract! plate, :id, :title, :description, :price, :available_quantity, :photo, :active, :chef_id, :plate_type_id, :plate_badge_id, :ingredients_id, :plate_accompaniment_id
  json.url plate_url(plate, format: :json)
end
