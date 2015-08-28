class SpeakingEventsController < InheritedResources::Base

  private

    def speaking_event_params
      params.require(:speaking_event).permit(:date, :time, :street_address, :city, :zipcode, :description, :price, :speaker_id)
    end
end

