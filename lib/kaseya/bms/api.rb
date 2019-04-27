module Kaseya::BMS
  class Api
    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def get_many(path, params = {})
      Collection.new connection.get(path, params)
    end

    def get_one(path, params = {})
      Response.new connection.get(path, params)
    end

    def post(path, params = {})
      Result.new connection.post(path, params)
    end

    def put(path, params = {})
      Result.new connection.put(path, params)
    end

    def delete(path)
      connection.delete(path)
    end
  end
end