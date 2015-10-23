class RemoveMemberBirthDate < ActiveRecord::Migration
  def change
    remove_column :members, :birth_date
  end
end
