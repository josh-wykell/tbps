class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :url
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
