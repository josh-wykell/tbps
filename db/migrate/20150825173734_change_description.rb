class ChangeDescription < ActiveRecord::Migration
  def change
    rename_column :other_events, :descritption, :description
  end
end
