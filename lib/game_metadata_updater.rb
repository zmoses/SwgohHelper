include SwgohComlinkApi
module GameMetadataUpdater
  def update_game_units
    api_data = comlink_api.data(game_metadata_version, false, 3)
    units_data = api_data["units"].map do |unit|
      { in_game_id: unit["baseId"], type: unit["crew"].present? ? "Ship" : "Character" }
    end
    Unit.upsert_all(units_data.uniq, unique_by: [ :in_game_id ])
  end

  def game_metadata_version
    comlink_api.metadata["latestGamedataVersion"]
  end
end
