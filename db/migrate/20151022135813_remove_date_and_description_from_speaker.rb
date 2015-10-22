class RemoveDateAndDescriptionFromSpeaker < ActiveRecord::Migration
  def change
    remove_column :speakers, :date
    remove_column :speakers, :description
  end
end
