class AddDegreeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :liscence, :string
  end
end
