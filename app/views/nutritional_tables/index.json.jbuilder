json.array!(@nutritional_tables) do |nutritional_table|
  json.extract! nutritional_table, :id, :energetic_value, :carbohydrate, :protein, :total_fat, :saturated_fat, :trans_fat, :sodium, :iron
  json.url nutritional_table_url(nutritional_table, format: :json)
end
