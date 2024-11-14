class ChangeUnitIdToInGameId < ActiveRecord::Migration[8.0]
  def change
    rename_column :roster_units, :unit_id, :in_game_id
  end
end
