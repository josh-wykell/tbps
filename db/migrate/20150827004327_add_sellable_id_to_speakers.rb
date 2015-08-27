class AddSellableIdToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :sellable_id, :integer
  end
end
