class CartsController < InheritedResources::Base

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart.paypal_url(cart_path(@cart))
    else
      render :new
    end
  end

  private

    def cart_params
      params.require(:cart).permit(:purchased_at)
    end
end

