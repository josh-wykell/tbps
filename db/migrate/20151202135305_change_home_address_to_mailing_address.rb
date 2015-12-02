class ChangeHomeAddressToMailingAddress < ActiveRecord::Migration
  def change
    rename_column :members, :home_address_street, :mailing_address_street
    rename_column :members, :home_address_city,   :mailing_address_city
    rename_column :members, :home_address_state,  :mailing_address_state
    rename_column :members, :home_address_zip,    :mailing_address_zip
  end
end


