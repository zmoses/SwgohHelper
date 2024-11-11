class AddIndexToRosterUnit < ActiveRecord::Migration[8.0]
  def change
    add_index :roster_units, %i[player_id unit_id], unique: true
  end
end
