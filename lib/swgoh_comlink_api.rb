# frozen_string_literal: true

# API for retrieving data from the SW:GOH game
module SwgohComlinkApi
  def comlink_api
    SwgohComlink.new(
      ENV["COMLINK_URL"],
      secret_key: ENV["COMLINK_SECRET_KEY"],
      access_key: ENV["COMLINK_ACCESS_KEY"]
    )
  end
end
