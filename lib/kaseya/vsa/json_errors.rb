module Kaseya::VSA
  class JsonErrors < Faraday::Middleware
    def on_complete(env)
      unless env.response.body["ResponseCode"] == 0
        raise VSAError, env.response
      end
    end
  end
end
