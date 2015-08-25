json.array!(@films) do |film|
  json.extract! film, :id, :title, :date, :time, :first_speaker, :second_speaker, :synopsis
  json.url film_url(film, format: :json)
end
