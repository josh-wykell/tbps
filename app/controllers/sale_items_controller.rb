class SaleItemsController < InheritedResources::Base

  def create
    @speaking_event = SpeakingEvent.find(params[:speaking_event_id])
      if current_cart.cart_membership_status.is_a_member
        @price = @speaking_event.member_price
      else
        @price = @speaking_event.regular_price
      end
    @sale_item = SaleItem.create!(:cart => current_cart, :speaking_event => @speaking_event, :quantity => 1, :unit_price => @price)
    flash[:notice] = "Added #{@speaking_event.speaker.name} at #{@speaking_event.time} to cart"
    redirect_to :back
  end

  def update
    @cart = Cart.find(params[:cart_id])
    @sale_item = @cart.sale_items.find(params[:id])
    @sale_item.quantity = params[:sale_item][:quantity]
    redirect_to current_cart_path
  end

  def destroy
    @cart = Cart.find(params[:cart_id])
    @sale_item = @cart.sale_items.find(params[:id])
    @sale_item.destroy
    redirect_to current_cart_path
  end

  private

    def sale_item_params
      params.require(:sale_item).permit(:cart_id, :speaking_event_id, :quantity, :unit_price)
    end
end

