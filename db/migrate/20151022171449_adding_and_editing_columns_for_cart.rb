class AddingAndEditingColumnsForCart < ActiveRecord::Migration
  def change
    remove_column :carts, :buyer_last_name
    rename_column :carts, :buyer_first_name, :buyer_name
    add_column    :carts, :street_address, :string
    add_column    :carts, :zipcode, :string
    add_column    :carts, :city, :string
    add_column    :carts, :state, :string
    add_column    :carts, :country, :string
  end
end
