class AddLockVersion < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :lock_version, :integer
    add_column :users, :lock_version, :integer
    add_column :markets, :lock_version, :integer
    add_column :inventories , :lock_version, :integer
  end
end
