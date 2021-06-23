module Kaseya::VSA
  class Client::Alarms < Api
    def all(params = {})
      get_many "assetmgmt/alarms/true", params
    end

    def new_alarms(params = {})
      get_many "assetmgmt/alarms/false", params
    end

    def find(id)
      get_one "assetmgmt/alarms/#{id}"
    end

    def close(id)
      put "assetmgmt/alarms/#{id}/close"
    end
  end
end