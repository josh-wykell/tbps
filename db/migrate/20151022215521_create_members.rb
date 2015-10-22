class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :member_last_name
      t.string :member_first_name
      t.string :degree
      t.string :liscense_number
      t.string :home_address_street
      t.string :home_address_city
      t.string :home_address_state
      t.integer :home_address_zip
      t.string :office_address_street
      t.string :office_address_city
      t.string :office_address_state
      t.integer :office_address_zip
      t.string :email
      t.string :office_phone
      t.string :fax
      t.string :cell_phone
      t.string :home_phone
      t.integer :birth_day
      t.string :birth_month
      t.integer :birth_year
      t.text :practice_specialities
      t.boolean :publish, null: false, default: false
      t.boolean :new_patients, null: false, default: false

      t.timestamps null: false
    end
  end
end
