class CartsController < InheritedResources::Base

  def show
    @cart = current_cart
  end

  private

    def cart_params
      params.require(:cart).permit(:purchased_at)
    end
end

