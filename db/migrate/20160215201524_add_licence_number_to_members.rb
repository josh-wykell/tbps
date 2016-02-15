class AddLicenceNumberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :license_number, :integer
  end
end
