class SalesController < InheritedResources::Base

  private

    def sale_params
      params.require(:sale).permit(:price, :sellable_id, :sellable_type, :cart_id)
    end
end

