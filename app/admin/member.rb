ActiveAdmin.register Member do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :member_last_name, :member_first_name, :degree, :mailing_address_street, 
               :mailing_address_city, :mailing_address_state, :mailing_address_zip, :office_address_street, :office_address_city, 
               :office_address_state, :office_address_zip, :email, :office_phone, :fax, :cell_phone, :home_phone, :birth_date,
               :practice_specialities, :membership_type, :publish, :new_patients, :liscense, :license_number
form do |f|
  f.input :member_last_name
  f.input :member_first_name
  f.input :degree
  f.input :liscense
  f.input :license_number
  f.input :mailing_address_street
  f.input :mailing_address_city
  f.input :mailing_address_state
  f.input :mailing_address_zip
  f.input :birth_date, as: :date_select, :start_year=>1916,:end_year=>2016
  f.input :office_address_street
  f.input :office_address_city
  f.input :office_address_state 
  f.input :office_address_zip
  f.input :email
  f.input :office_phone
  f.input :fax
  f.input :cell_phone
  f.input :home_phone
  f.input :practice_specialities
  f.input :membership_type
  f.input :publish, as: :radio
  f.input :new_patients, as: :radio
  f.action :submit, :as => :button 
  f.action :cancel, :as => :link
end


end
