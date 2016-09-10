class CreateTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :tiles do |t|
      t.string :color
      t.integer :position, array: true
      t.timestamp
    end
  end
end
