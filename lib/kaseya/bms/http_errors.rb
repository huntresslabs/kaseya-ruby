module Kaseya::BMS
  class HttpErrors < Faraday::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 400..600
        raise BMSError, env.response
      end
    end
  end
end
