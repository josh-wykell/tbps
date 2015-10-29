class ApplicationController < ActionController::Base
  helper_method :current_cart
  helper_method :mark_as_member
   #Prevent CSRF attacks by raising an exception.
   #For APIs, you may want to use :null_session instead.
  protect_from_forgery 
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

    def mark_as_member
    @member_token = params[:member_token] == "1" ? true : false
    if @member_token = 2
      current_cart.update_attribute(:is_a_member, true)
    end
    redirect_to speaking_events_path
  end

end
