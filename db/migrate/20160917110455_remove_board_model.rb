class RemoveBoardModel < ActiveRecord::Migration[5.0]
  def change
    drop_table :boards
    add_column :keys, :public_id, :integer, unique: true, null: false
  end
end
