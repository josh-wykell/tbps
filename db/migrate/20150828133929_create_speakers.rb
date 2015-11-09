class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.text :biography
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
