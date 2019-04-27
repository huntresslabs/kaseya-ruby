module Kaseya::BMS
  class Client
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def accounts
      @accounts ||= Client::Accounts.new(@connection)
    end

    def activities
      @activities ||= Client::Activities.new(@connection)
    end

    def admin
      @admin ||= Client::Admin.new(@connection)
    end

    def contacts
      @contacts ||= Client::Contacts.new(@connection)
    end

    def lists
      @lists ||= Client::Lists.new(@connection)
    end

    def locations
      @locations ||= Client::Locations.new(@connection)
    end

    def tickets
      @tickets ||= Client::Tickets.new(@connection)
    end
  end
end