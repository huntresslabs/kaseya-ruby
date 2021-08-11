module Kaseya::VSA
  class Client::Assets < Api
    def all(params = {})
      get_many "assetmgmt/assets", params
    end

    def find(id)
      get_one "assetmgmt/assets/#{id}"
    end
  end
end