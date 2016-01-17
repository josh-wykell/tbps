ActiveAdmin.register Cart do
  permit_params :buyer_name, :email, :zipcode, :city, :state, :country, :street_address
    # sale_item_attributs: [:id,:speaking_event_id, :quantity, :unit_price, :_destroy]
  
  index do
    column :buyer_name
    column :email
    column :street_address
    column :city
    column :state
    column :zipcode 
    column :purchased_at
  end

  # filter :sale_items, as: :check_boxes, collection: proc {SaleItem.speaking_event_id}
end

