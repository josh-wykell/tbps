class CartsController < InheritedResources::Base


  def update
    @cart = current_cart

    unless @cart.total_price == 0
      @cart.update stripe_cart_params.merge(email: stripe_params["stripeEmail"], card_token: stripe_params["stripeToken"], 
                                     buyer_name: stripe_params["stripeBillingName"], street_address: stripe_params["stripeBillingAddressLine1"], 
                                     zipcode: stripe_params["stripeBillingAddressZip"], city: stripe_params["stripeBillingAddressCity"], 
                                     state: stripe_params["stripeBillingAddressState"], country: stripe_params["stripeBillingAddressCountry"])
      raise "Please, check cart errors" unless @cart.valid?
      @cart.process_payment
      @cart.save
      flash[:notice] = 'Your order has been completed'
    else
      @cart.update(cart_params) 
      @cart.save
      flash[:notice] = 'Your order has been completed'
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :back
  end

  def show
    @cart = current_cart
  end

  def checkout
    @cart = current_cart
  end

  def edit
    @cart = current_cart
      # redirect_to root_path
  end

  def no_sale
    @cart = Cart.find(params[:id])
  end

  private

    def stripe_params
      params.permit :stripeEmail, :stripeToken, :stripeBillingName, :stripeBillingAddressLine1, 
                    :stripeBillingAddressZip, :stripeBillingAddressCity, :stripeBillingAddressState, :stripeBillingAddressCountry
    end


    def cart_params
      params.require(:cart).permit :purchased_at, :email, :card_token, :buyer_name, :zipcode, :city, :state, :country, :street_address
    end

    def stripe_cart_params
      params.permit :purchased_at, :email, :card_token, :buyer_name, :zipcode, :city, :state, :country, :street_address
    end

end
