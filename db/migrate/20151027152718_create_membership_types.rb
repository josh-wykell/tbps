class CreateMembershipTypes < ActiveRecord::Migration
  def change
    create_table :membership_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
