class DropCards < ActiveRecord::Migration[5.0]
  def change
    drop_table :cards
    add_column :tiles, :name, :string
    add_column :tiles, :status, :string
    add_timestamps :tiles
  end
end
