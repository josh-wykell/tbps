class VisitorsController < ApplicationController
  def index
    @current_speakers=Speaker.where("date >= ?", Date.today).limit(1)
  end
end
