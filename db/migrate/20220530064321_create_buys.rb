class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.datetime :start_time,  null: false
      t.integer :category_id, null: false
      t.string  :item_name,   null: false
      t.integer :price,       null: false
      t.references :user,     null: false,foreign_key: true
      t.timestamps
    end
  end
end
