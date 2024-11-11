class Player < ApplicationRecord
  has_many :roster_units, dependent: :destroy

  def update_roster
    comlink_api.roster(ally_code)
  end
end
