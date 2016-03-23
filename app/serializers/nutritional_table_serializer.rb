class NutritionalTableSerializer < ActiveModel::Serializer
  attributes :id, :energetic_value, :carbohydrate, :protein, :total_fat, :saturated_fat, :trans_fat, :sodium, :iron
end
