class RosterUnit < ApplicationRecord
  belongs_to :player

  validates :player_id, :in_game_id, presence: true
  validates :in_game_id, uniqueness: { scope: :player_id }
  validates :relic_level, numericality: { in: 0..9 }
  validates :gear_level, numericality: { in: 1..13 }
  validates :rarity_level, numericality: { in: 1..7 }

  def self.commit_roster_data(roster_data)
    RosterUnit.upsert_all(roster_data, unique_by: [ :player_id, :in_game_id ])
  end
end
