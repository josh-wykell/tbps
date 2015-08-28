class CreateOtherEvents < ActiveRecord::Migration
  def change
    create_table :other_events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :street_address
      t.string :city
      t.integer :zipcode
      t.text :description

      t.timestamps null: false
    end
  end
end
