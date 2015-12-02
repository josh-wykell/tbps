class VisitorsController < ApplicationController
  def index
    @current_speakers        = Speaker.where("date >= ?",    Date.today).limit(4).offset(1).order("date asc")
    @next_speaker            = Speaker.where("date >= ?",    Date.today).limit(1)
    @current_films           = Film.where("date >= ?",       Date.today).limit(1)
    @current_other_events    = OtherEvent.where("date >= ?", Date.today).limit(1)

  end
end
