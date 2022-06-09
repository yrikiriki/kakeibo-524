class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :start_time, null: false
      t.integer :total_price, default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
