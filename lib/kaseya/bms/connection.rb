require "faraday"

require_relative "http_errors"

module Kaseya::BMS
  class Connection < Kaseya::Connection
    ERROR_MIDDLEWARE = [Kaseya::BMS::HttpErrors]

    def initialize(host, token, expires)
      super(host, token)
      @expires = expires
    end

    def connection_options
      {
        headers: {
          user_agent: Kaseya::BMS.user_agent,
        },
        url: "https://#{@host}/api",
        ssl: { verify: !Kaseya::BMS.debug },
      }
    end
  end
end