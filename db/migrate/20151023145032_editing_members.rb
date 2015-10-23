class EditingMembers < ActiveRecord::Migration
  def change
    rename_column :members, :birth_day, :birth_date
    remove_column :members, :birth_month
    remove_column :members, :birth_year
  end
end
