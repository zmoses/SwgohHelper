class CreateGuilds < ActiveRecord::Migration[8.0]
  def change
    create_table :guilds do |t|
      t.timestamps
      t.string :name
      t.string :in_game_id
    end
  end
end
