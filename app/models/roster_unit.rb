class RosterUnit < ApplicationRecord
  belongs_to :player

  def self.commit_roster_data(roster_data)
    RosterUnit.upsert_all(roster_data, unique_by: [:player_id, :unit_id])
  end
end
