class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.decimal :price
      t.integer :sellable_id
      t.string :sellable_type
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
