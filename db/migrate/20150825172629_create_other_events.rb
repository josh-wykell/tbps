class CreateOtherEvents < ActiveRecord::Migration
  def change
    create_table :other_events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :descritption

      t.timestamps null: false
    end
  end
end
