json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :date, :time, :url, :image, :description
  json.url speaker_url(speaker, format: :json)
end
