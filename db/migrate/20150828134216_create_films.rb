class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :first_speaker
      t.string :second_speaker
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
