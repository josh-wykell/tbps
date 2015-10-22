class CartsController < InheritedResources::Base


  def update
    @cart = current_cart
    @cart.update cart_params.merge(email: stripe_params["stripeEmail"], card_token:stripe_params["stripeToken"])
    raise "Please, check cart errors" unless @cart.valid?
    @cart.process_payment
    @cart.save
    flash[:notice] = 'Your order has been completed'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  def show
    @cart = current_cart
  end

  def checkout
    @cart = current_cart
  end

  private

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end


    def cart_params
      params.require(:cart).permit(:purchased_at)
    end
end
