class SpeakingEventsController < InheritedResources::Base

  private

    def speaking_event_params
      params.require(:speaking_event).permit(:date, :time, :street_address, :city, :zipcode, :description, :regular_price, :member_price, :speaker_id)
    end
end

