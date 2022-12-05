class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
    add_foreign_key :markets, :users, column: :user_id , primary_key: :id
    add_foreign_key :markets, :items, column: :item_id , primary_key: :id
  end
end
