module Kaseya::VSA
  class Client::MachineGroups < Api
    def all(params = {})
      get_many "system/machinegroups", params
    end
  end
end