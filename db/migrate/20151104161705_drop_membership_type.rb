class DropMembershipType < ActiveRecord::Migration
  def change
    drop_table :membership_types
  end
end
