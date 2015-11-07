json.array!(@entities) do |entity|
  json.extract! entity, :id, :modules_categories_id, :name, :slug, :controller, :is_dev
  json.url entity_url(entity, format: :json)
end
