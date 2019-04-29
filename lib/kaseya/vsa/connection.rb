require "faraday"
require "faraday_middleware"

module Kaseya::VSA
  class Connection < Kaseya::Connection
    def connection_options
      {
        headers: {
          user_agent: Kaseya::VSA.user_agent
        },
        url: "https://#{@host}/api/v1.0",
        ssl: { verify: !Kaseya::VSA.debug },
      }
    end
  end
end