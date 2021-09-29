class CreateClick < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.references :url, foreign_key: true
      t.string :ip, null: false

      t.timestamps
    end
  end
end
