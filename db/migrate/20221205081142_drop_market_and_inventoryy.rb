class DropMarketAndInventoryy < ActiveRecord::Migration[7.0]
  def change
    drop_table :markets
    drop_table :inventories
  end
end
