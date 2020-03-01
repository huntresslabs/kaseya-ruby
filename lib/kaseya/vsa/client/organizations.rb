module Kaseya::VSA
  class Client::Organizations < Api
    def all(params = {})
      get_many "system/orgs", params
    end

    def find(id)
      get_one "system/orgs/#{id}"
    end

    def machine_groups(id, params = {})
      get_many "system/orgs/#{id}/machine_groups", params
    end

    def create(params = {})
      post "system/orgs", params
    end

    def update(id, params = {})
      put "system/orgs/#{id}", params
    end

    def delete(id)
      delete "system/orgs/#{id}"
    end
  end
end