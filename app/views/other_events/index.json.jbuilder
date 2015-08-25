json.array!(@other_events) do |other_event|
  json.extract! other_event, :id, :title, :date, :time, :descritption
  json.url other_event_url(other_event, format: :json)
end
