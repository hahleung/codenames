class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.integer :tiles, array: true
      t.timestamps
    end
  end
end
