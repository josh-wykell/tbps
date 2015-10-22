class SpeakersController < InheritedResources::Base

  private

    def speaker_params
      params.require(:speaker).permit(:name, :biography, :image, :url)
    end
end

