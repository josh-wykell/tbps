class RemoveIsAMemberFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :is_a_member
  end
end
