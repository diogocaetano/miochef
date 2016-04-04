json.array!(@dogs) do |dog|
  json.extract! dog, :id, :nome
  json.url dog_url(dog, format: :json)
end
