class AddingCheckoutToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :buyer_first_name, :string
    add_column :carts, :buyer_last_name,  :string
    add_column :carts, :email,            :string
    add_column :carts, :card_token,       :string
  end
end
