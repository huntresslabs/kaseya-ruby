module Kaseya::VSA
  class Api
    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def get_many(path, params = {})
      Kaseya::Collection.new connection.get(path, params)
    end

    def get_one(path, params = {})
      Kaseya::Response.new connection.get(path, params)
    end
  end
end