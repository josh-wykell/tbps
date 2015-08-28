class SaleItemsController < InheritedResources::Base

  def create
    @sale_item = SaleItem.create(sale_item_params)
    # flash[:notice] = "Added #{@sale_item.name} to cart."
    redirect_to current_cart_path
  end

  private

    def sale_item_params
      params.require(:sale_item).permit(:sellable_id, :sellable_type, :cart_id)
    end
end

