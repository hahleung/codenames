class AddFrenchTranslationToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :french_translation, :string, default: ""
  end
end
