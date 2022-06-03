class CreateBadgets < ActiveRecord::Migration[6.0]
  def change
    create_table :badgets do |t|
      t.integer     :month_id,     null: false
      t.integer     :income,       null: false
      t.references  :user,         null: false,foreign_key: true
      t.timestamps
    end
  end
end
