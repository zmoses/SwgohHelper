require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "Associations" do
    it { should have_many(:roster_units).dependent(:destroy) }
  end

  describe '#update_roster' do
    it 'updates the roster' do
      # player = create(:player)
      # expect(player.update_roster).to be_truthy
    end
  end
end
