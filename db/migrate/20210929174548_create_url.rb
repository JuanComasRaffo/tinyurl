class CreateUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :short_url, null: false
      t.string :initial_url, null: false
      t.integer :clicks_count, default: 0
      t.index :short_url, unique: true

      t.timestamps
    end
  end
end
