module Kaseya::VSA
  class Client
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end

    def agents
      @agents ||= Client::Agents.new(@connection)
    end

    def machine_groups
      @machine_groups ||= Client::MachineGroups.new(@connection)
    end

    def organizations
      @organizations ||= Client::Organizations.new(@connection)
    end

    def assets
      @assets ||= Client::Assets.new(@connection)
    end

    def alarms
      @alarms ||= Client::Alarms.new(@connection)
    end

    def logs
      @logs ||= Client::Logs.new(@connection)
    end
  end
end