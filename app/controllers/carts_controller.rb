class CartsController < InheritedResources::Base

  private

    def cart_params
      params.require(:cart).permit(:purchased_at)
    end
end

