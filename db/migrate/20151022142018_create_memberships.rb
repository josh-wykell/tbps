class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :card_token
      t.string :email
      t.datetime :purchased_at
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
