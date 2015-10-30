class CreateCartMembershipStatuses < ActiveRecord::Migration
  def change
    create_table :cart_membership_statuses do |t|
      t.boolean :is_a_member, null: false, default: false
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
