class AddDonationsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :donation, :decimal
  end
end
