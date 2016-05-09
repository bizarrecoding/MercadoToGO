json.array!(@products) do |product|
  json.extract! product, :id, :name, :id
  json.url product_url(product, format: :json)
end