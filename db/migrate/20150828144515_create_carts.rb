class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.datetime :purchased_at
      t.string :email
      t.string :card_token
      t.string :buyer_name
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.string :street_address

      t.timestamps null: false
    end
  end
end


