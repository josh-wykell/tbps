class AddThemeToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :theme, :string
  end
end
