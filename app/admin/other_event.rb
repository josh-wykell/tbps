ActiveAdmin.register OtherEvent do

 permit_params :title, :date, :time, :street_address, :city, :zipcode, :description
end
