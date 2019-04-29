module Kaseya::VSA
  class Client
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end
  end
end