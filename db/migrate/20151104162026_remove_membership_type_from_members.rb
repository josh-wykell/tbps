class RemoveMembershipTypeFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :membership_type_id
    add_column :members, :membership_type, :string
  end
end
