class AddMembersToMembership < ActiveRecord::Migration
  def change
    add_reference :memberships, :member, index: true
  end
end
