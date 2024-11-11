class ChangeUnitNameField < ActiveRecord::Migration[8.0]
  def change
    rename_column :units, :name_text, :in_game_id
    add_index :units, :in_game_id, unique: true
  end
end
