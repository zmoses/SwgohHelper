class CreateRosterUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :roster_units do |t|
      t.timestamps
      t.column :unit_id, :string
      t.column :player_id, :string
      t.column :relic_level, :integer
      t.column :gear_level, :integer
      t.column :rarity_level, :integer
    end
  end
end
