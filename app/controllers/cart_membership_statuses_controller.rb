class CartMembershipStatusesController < InheritedResources::Base

  def new
    cart = Cart.find(params[:cart_id])
    @cart_membership_status = cart.build_cart_membership_status
  end

  def create
    cart = Cart.find(params[:cart_id])
    @cart_membership_status = cart.create_cart_membership_status(cart_membership_status_params)
    @cart_membership_status.save
    redirect_to speakers_path
  end

  private

  def cart_membership_status_params
    params.require(:cart_membership_status).permit(:cart_id, :is_a_member)
  end
end