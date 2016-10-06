class AddFrenchTranslationToTile < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :french_translation, :string
  end
end
