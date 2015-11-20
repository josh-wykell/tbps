class ChangeSpellingOfLicense < ActiveRecord::Migration
  def change
    rename_column :members, :liscence, :liscense
  end
end
