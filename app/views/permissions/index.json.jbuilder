json.array!(@permissions) do |permission|
  json.extract! permission, :id, :entity_id, :route, :action_name
  json.url permission_url(permission, format: :json)
end
