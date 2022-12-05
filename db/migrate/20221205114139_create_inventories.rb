class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.references :seller, null: false
      t.decimal :price
      t.integer :qty

      t.timestamps
    end
    add_foreign_key :inventories, :users, column: :user_id , primary_key: :id
    add_foreign_key :inventories, :items, column: :item_id , primary_key: :id
    add_foreign_key :inventories, :users, column: :seller_id , primary_key: :id
  end
end
