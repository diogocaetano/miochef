json.array!(@users) do |user|
  json.extract! user, :id, :role_id, :name, :is_admin, :is_representative
  json.url user_url(user, format: :json)
end
