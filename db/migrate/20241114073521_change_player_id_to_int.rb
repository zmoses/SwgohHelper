class ChangePlayerIdToInt < ActiveRecord::Migration[8.0]
  def change
    change_column :roster_units, :player_id, :integer, using: "player_id::integer"
  end
end
