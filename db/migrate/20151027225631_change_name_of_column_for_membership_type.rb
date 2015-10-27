class ChangeNameOfColumnForMembershipType < ActiveRecord::Migration
  def change
    rename_column :membership_types, :type, :type_of
  end
end
