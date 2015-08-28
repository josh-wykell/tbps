json.array!(@sale_items) do |sale_item|
  json.extract! sale_item, :id, :sellable_id, :sellable_type
  json.url sale_item_url(sale_item, format: :json)
end
