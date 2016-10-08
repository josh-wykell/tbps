class ApplicationController < ActionController::Base
  helper_method :current_cart
  protect_from_forgery
  #this current_cart method creates a session that is tied to the cart. If the current_cart is purchased it will make the session id nil
  # if the session id is nil it will create a new cart and set the session id to that cart's id.
  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end
