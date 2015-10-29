class AddMemberPriceToSpeakingEvents < ActiveRecord::Migration
  def change
    add_column :speaking_events, :member_price, :decimal
    rename_column :speaking_events, :price, :regular_price
  end
end
