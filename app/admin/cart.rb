ActiveAdmin.register Cart do
  permit_params :buyer_name, :email, :zipcode, :city, :state, :country, :street_address
  
  index do
    column :buyer_name
    column :email
    column :street_address
    column :city
    column :state
    column :zipcode 
    column :purchased_at
  end
end

