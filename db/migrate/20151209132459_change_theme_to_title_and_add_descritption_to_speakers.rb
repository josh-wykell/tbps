class ChangeThemeToTitleAndAddDescritptionToSpeakers < ActiveRecord::Migration
  def change
    rename_column :speakers, :theme, :title
    add_column :speakers, :description, :string
  end
end
