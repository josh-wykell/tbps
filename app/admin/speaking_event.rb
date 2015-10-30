ActiveAdmin.register SpeakingEvent do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :date, :time, :street_address, :city, :zipcode, :description, :regular_price, :speaker_id, :member_price

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
