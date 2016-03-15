json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :description, :image
  json.url badge_url(badge, format: :json)
end
