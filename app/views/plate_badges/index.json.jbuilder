json.array!(@plate_badges) do |plate_badge|
  json.extract! plate_badge, :id, :name, :description, :image
  json.url plate_badge_url(plate_badge, format: :json)
end
