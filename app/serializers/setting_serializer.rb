class SettingSerializer < ActiveModel::Serializer
  attributes :id, :key, :name, :value
end
