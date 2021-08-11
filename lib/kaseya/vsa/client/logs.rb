module Kaseya::VSA
  class Client::Logs < Api
    def alarms_by_agent(agent_guid, params = {})
      get_many "assetmgmt/logs/#{agent_guid}/alarms", params
    end
  end
end