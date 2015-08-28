class CreateSpeakingEvents < ActiveRecord::Migration
  def change
    create_table :speaking_events do |t|
      t.date :date
      t.time :time
      t.string :street_address
      t.string :city
      t.integer :zipcode
      t.text :description
      t.decimal :price
      t.belongs_to :speaker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
