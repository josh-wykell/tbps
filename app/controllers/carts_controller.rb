class CartsController < InheritedResources::Base

  def new
  end

  def create
    @cart = Cart.new cart_params.merge(email: stripe_params["stripeEmail"], card_token:stripe_params["stripeToken"])
    raise "Please, check cart errors" unless @cart.valid?
    @cart.process_payment
    @cart.save
    redirect_to @cart, notice: 'Your order has been completed'
  end

  def show
    @cart = current_cart
  end

  def checkout
    @cart = current_cart
  end

  # def create
  #   @registration = Registration.new registration_params.merge(email: stripe_params["stripeEmail"],
  #                                                              card_token: stripe_params["stripeToken"])
  #   raise "Please, check registration errors" unless @registration.valid?
  #   @registration.process_payment
  #   @registration.save
  #   redirect_to @registration, notice: 'Registration was successfully created.'
  # rescue e
  #   flash[:error] = e.message
  #   render :new
  # end

  # private
  #   def stripe_params
  #     params.permit :stripeEmail, :stripeToken
  #   end

  private

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end


    def cart_params
      params.require(:cart).permit(:purchased_at)
    end
  
end

