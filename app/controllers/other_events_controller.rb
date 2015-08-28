class OtherEventsController < InheritedResources::Base

  private

    def other_event_params
      params.require(:other_event).permit(:title, :date, :time, :street_address, :city, :zipcode, :description)
    end
end

