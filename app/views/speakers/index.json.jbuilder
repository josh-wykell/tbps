json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :date, :biography, :description, :image, :url
  json.url speaker_url(speaker, format: :json)
end
