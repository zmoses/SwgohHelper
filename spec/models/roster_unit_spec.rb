require 'rails_helper'

RSpec.describe RosterUnit, type: :model do
  describe '.commit_roster_data' do
    let(:roster_data) do
      [
        { player_id: 1, in_game_id: 'unit1', relic_level: 4, gear_level: 13, rarity_level: 7 },
        { player_id: 1, in_game_id: 'unit2', relic_level: 0, gear_level: 8, rarity_level: 5 }
      ]
    end

    it 'inserts new roster units' do
      expect { RosterUnit.commit_roster_data(roster_data) }.to change { RosterUnit.count }.by(2)
    end

    it 'updates existing roster units' do
      create(:player, id: 1)
      create(:roster_unit, player_id: 1, in_game_id: 'unit1', relic_level: 2, gear_level: 13, rarity_level: 7)
      expect { RosterUnit.commit_roster_data(roster_data) }.to change { RosterUnit.count }.by(1)
        .and change { RosterUnit.find_by(player_id: 1, in_game_id: 'unit1').relic_level }.from(2).to(4)
    end
  end
end
