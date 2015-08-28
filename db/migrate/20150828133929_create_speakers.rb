class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.date :date
      t.text :biography
      t.text :description
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
