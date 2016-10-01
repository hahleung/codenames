class AddFirstTeamToKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :keys, :first_team, :string
  end
end
