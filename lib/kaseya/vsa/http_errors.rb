module Kaseya::VSA
  class HttpErrors < Faraday::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 400..600
        raise VSAError, env.response
      end
    end
  end
end
