class CartsController < InheritedResources::Base


  def update
    @cart = current_cart
    @cart.update cart_params.merge(email: stripe_params["stripeEmail"], card_token: stripe_params["stripeToken"], 
                                   buyer_name: stripe_params["stripeBillingName"], street_address: stripe_params["stripeBillingAddressLine1"], 
                                   zipcode: stripe_params["stripeBillingAddressZip"], city: stripe_params["stripeBillingAddressCity"], 
                                   state: stripe_params["stripeBillingAddressState"], country: stripe_params["stripeBillingAddressCountry"])
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

  def mark_as_member
    @cart = Cart.find(params[:id])
    @member_token = params[:member_token] == "1" ? true : false
    if @member_token = 2
      @cart.update_attribute(:is_a_member, true)
    end
    redirect_to speaking_events_path
  end

  private

    def stripe_params
      params.permit :stripeEmail, :stripeToken, :stripeBillingName, :stripeBillingAddressLine1, 
                    :stripeBillingAddressZip, :stripeBillingAddressCity, :stripeBillingAddressState, :stripeBillingAddressCountry
    end


    def cart_params
      params.permit :purchased_at
    end
end
