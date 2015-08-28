class FilmsController < InheritedResources::Base

  private

    def film_params
      params.require(:film).permit(:title, :date, :time, :first_speaker, :second_speaker, :synopsis)
    end
end

