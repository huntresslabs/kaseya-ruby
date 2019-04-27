module Kaseya::BMS
  class Client::Admin < Api
    def statuses(params = {})
      get_many "system/statuses", params
    end

    def priorities(params = {})
      get_many "system/priorities", params
    end

    def queues(params = {})
      get_many "system/queues", params
    end
  end
end