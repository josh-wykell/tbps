class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :card_token
      t.string :email
      t.datetime :purchased_at

      t.timestamps null: false
    end
  end
end
