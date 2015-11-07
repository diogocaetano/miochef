json.array!(@modules_categories) do |modules_category|
  json.extract! modules_category, :id, :name, :icon
  json.url modules_category_url(modules_category, format: :json)
end
