class AddTypeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :membership_type_id, :integer
    add_index 'members', ['membership_type_id'], :name => 'index_membship_type_id'
  end
end
