class SaleItemsController < InheritedResources::Base

  private

    def sale_item_params
      params.require(:sale_item).permit(:sellable_id, :sellable_type)
    end
end

