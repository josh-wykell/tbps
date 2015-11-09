class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.belongs_to :cart, index: true, foreign_key: true
      t.belongs_to :speaking_event, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      
      t.timestamps null: false
    end
  end
end
