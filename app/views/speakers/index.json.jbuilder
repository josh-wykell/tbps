json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :date, :biography, :description, :image, :url
  json.url speaker_url(speaker, format: :json)
end


<p id="notice"><%= notice %></p>

<h1>2015-2016 Speakers</h1>
<% @speakers.in_groups_of(4) do |speakers| %>
  <div class="row">
    <% speakers.each do |speaker| %>
      <div class="col-lg-3">
        <div class="well">
          <h4><%= link_to "#{speaker.name}", speaker_path(speaker) %></h4>
          <h2>Theme: <%= speaker.theme %></h2>
          <h2><%= speaker.date.strftime("%B %e, %Y") %></h2>
          <h2>Bio:</h2>
          <p><%= truncate speaker.biography, length: 50, separator: ' ' %> <%= link_to "For a full biography, event times, and prices click here.", speaker_path(speaker) %></p>
        </div>
      </div>
    <% end %>
  </div>
<% end %>
<br>

