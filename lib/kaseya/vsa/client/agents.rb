module Kaseya::VSA
  class Client::Agents < Api
    def all(params = {})
      get_many "assetmgmt/agents", params
    end

    def find(id)
      get_one "assetmgmt/agents/#{id}"
    end
  end
end