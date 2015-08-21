class SpeakersController < InheritedResources::Base

  private

    def speaker_params
      params.require(:speaker).permit(:name, :date, :time, :url, :image, :description)
    end
end

