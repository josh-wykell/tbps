class RemoveLiscenseNumberFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :liscense_number
  end
end
