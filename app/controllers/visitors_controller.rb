class VisitorsController < ApplicationController
  def index
    @current_speaking_events = SpeakingEvent.where("date >= ?", Date.today).limit(1)
    @current_films           = Film.where("date >= ?", Date.today).limit(1)
    @current_other_events    = OtherEvent.where("date >= ?", Date.today).limit(1)

  end
end
