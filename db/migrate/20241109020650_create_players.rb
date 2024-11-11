class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.timestamps
      t.column :ally_code, :integer
      t.column :name, :string
      t.column :guild_id, :integer
    end
  end
end
