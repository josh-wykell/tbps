json.array!(@sales) do |sale|
  json.extract! sale, :id, :price, :sellable_id, :sellable_type, :cart_id
  json.url sale_url(sale, format: :json)
end
