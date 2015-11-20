ActiveAdmin.register Member do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :member_last_name, :member_first_name, :degree, :home_address_street, 
               :home_address_city, :home_address_state, :home_address_zip, :office_address_street, :office_address_city, 
               :office_address_state, :office_address_zip, :email, :office_phone, :fax, :cell_phone, :home_phone, :birth_date,
               :practice_specialities, :membership_type, :publish, :new_patients, :liscense
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
