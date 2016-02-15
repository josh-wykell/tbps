class ChangeLicenseNumberToString < ActiveRecord::Migration
  def change
    change_column :members, :license_number, :string
  end
end
