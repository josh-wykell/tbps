class AddIsAMemberToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :is_a_member, :boolean, null: false, default: false
  end
end
