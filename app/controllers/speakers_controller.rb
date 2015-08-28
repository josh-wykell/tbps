class SpeakersController < InheritedResources::Base

  private

    def speaker_params
      params.require(:speaker).permit(:name, :date, :biography, :description, :image, :url)
    end
end

