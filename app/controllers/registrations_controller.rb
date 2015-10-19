class RegistrationsController < ApplicationController

  def new
    @registration = Registration.new
    @cart         = current_cart
  end

  # def create
  #   @cart = current_cart
  #   @amount = @cart.total_price_in_cents

  #   customer = Stripe::Customer.create(
  #     :email => 'example@stripe.com',
  #     :card  => params[:stripeToken]
  #   )

  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'usd'
  #   )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to charges_path
  # end

  def create
    @registration = Registration.new registration_params.merge(email: stripe_params["stripeEmail"],
                                                               card_token: stripe_params["stripeToken"])
    raise "Please, check registration errors" unless @registration.valid?
    @registration.process_payment
    @registration.save
    redirect_to @registration, notice: 'Registration was successfully created.'
  # rescue 
  #   flash[:error] = e.message
  #   render :new
  end

  private
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def registration_params
      params.require(:registration).permit(:last_name, :first_name, :stripe_card_token)
    end
end
