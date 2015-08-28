class AddCartIdToSaleItems < ActiveRecord::Migration
  def change
    add_column :sale_items, :cart_id, :integer
  end
end
