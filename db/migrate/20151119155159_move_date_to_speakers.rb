class MoveDateToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :date, :date
  end
end
