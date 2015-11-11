class SpeakersController < InheritedResources::Base

  def show
    @speaker = Speaker.find(params[:id])
    @speaking_events = SpeakingEvent.where("speaker_id = #{@speaker.id}")
  end

  private

    def speaker_params
      params.require(:speaker).permit(:name, :biography, :image, :url)
    end
end

