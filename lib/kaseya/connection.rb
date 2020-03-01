require "faraday"
require "faraday_middleware"

module Kaseya
  class Connection
    ODATA_PARAMS = [:skip, :top, :orderby, :filter]
    ERROR_MIDDLEWARE = []

    def initialize(host, token)
      @host = host
      @token = token

      @connection = Faraday::Connection.new(connection_options) do |conn|
        ERROR_MIDDLEWARE.each do |klass|
          conn.use klass
        end

        conn.authorization :Bearer, @token
        conn.request :json
        conn.response :json
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

    def connection_options
      {}
    end

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