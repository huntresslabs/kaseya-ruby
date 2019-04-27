require "faraday"
require "faraday_middleware"

module Kaseya::BMS
  class Connection
    ODATA_PARAMS = [:skip, :top, :orderby, :filter]

    def initialize(host, token, expires)
      @host = host
      @token = token
      @expires = expires

      options = {
        headers: {
          user_agent: Kaseya::BMS.user_agent,
        },
        url: "https://#{@host}/api",
        ssl: { verify: !Kaseya::BMS.debug },
      }

      @connection ||= Faraday::Connection.new(options) do |conn|
        conn.authorization :Bearer, @token

        conn.request :json

        conn.response :json
        conn.response :raise_error

        conn.adapter Faraday.default_adapter
      end
    end

    def get(path, params = {})
      response = @connection.get(path, format_params(params))
      response.body
    end

    def post(path, params = {})
      response = @connection.post(path, format_params(params))
      response.body
    end

    def put(path, params = {})
      response = @connection.put(path, format_params(params))
      response.body
    end

    def delete(path)
      response = @connection.delete(path)
    end

    private

    def format_params(params)
      params.transform_keys do |key|
        case
        when ODATA_PARAMS.include?(key.to_sym)  then "$#{key}"
        when key.is_a?(Symbol)                  then key.to_s.camelize
        else key
        end
      end
    end
  end
end