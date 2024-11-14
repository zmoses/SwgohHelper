require "rails_helper"

RSpec.describe RosterUnit, type: :model do
  describe "Validations" do
    let(:player) { create(:player) }
    subject { build(:roster_unit, player_id: player.id) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a player" do
      subject.player_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an in_game_id" do
      subject.in_game_id = nil
      expect(subject).to_not be_valid
    end

    it "has a valid rarity level" do
      subject.rarity_level = 0
      expect(subject).to_not be_valid
      subject.rarity_level = 8
      expect(subject).to_not be_valid
      subject.rarity_level = 5
      expect(subject).to be_valid
    end

    it "has a valid gear level" do
      subject.rarity_level = 0
      expect(subject).to_not be_valid
      subject.rarity_level = 15
      expect(subject).to_not be_valid
      subject.rarity_level = 5
      expect(subject).to be_valid
    end

    it "has a valid relic level" do
      subject.rarity_level = -1
      expect(subject).to_not be_valid
      subject.rarity_level = 10
      expect(subject).to_not be_valid
      subject.rarity_level = 5
      expect(subject).to be_valid
    end
  end

  describe ".commit_roster_data" do
    let(:roster_data) do
      [
        { player_id: 1, in_game_id: "unit1", relic_level: 4, gear_level: 13, rarity_level: 7 },
        { player_id: 1, in_game_id: "unit2", relic_level: 0, gear_level: 8, rarity_level: 5 }
      ]
    end

    it "inserts new roster units" do
      expect { RosterUnit.commit_roster_data(roster_data) }.to change { RosterUnit.count }.by(2)
    end

    it "updates existing roster units" do
      create(:player, id: 1)
      create(:roster_unit, player_id: 1, in_game_id: "unit1", relic_level: 2, gear_level: 13, rarity_level: 7)
      expect { RosterUnit.commit_roster_data(roster_data) }.to change { RosterUnit.count }.by(1)
        .and change { RosterUnit.find_by(player_id: 1, in_game_id: "unit1").relic_level }.from(2).to(4)
    end
  end
end
