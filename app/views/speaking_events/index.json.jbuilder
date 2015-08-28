json.array!(@speaking_events) do |speaking_event|
  json.extract! speaking_event, :id, :date, :time, :street_address, :city, :zipcode, :description, :price, :speaker_id
  json.url speaking_event_url(speaking_event, format: :json)
end
