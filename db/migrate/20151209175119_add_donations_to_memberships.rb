class AddDonationsToMemberships < ActiveRecord::Migration
  def change
    add_column :members, :donation, :decimal
  end
end
