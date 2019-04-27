module Kaseya::BMS
  class Client::Locations < Api
    def all(params = {})
      get_many "crm/locations", params
    end

    def find(id)
      get_one "crm/locations/#{id}"
    end

    def new(params = {})
      post "crm/locations", params
    end

    def update(id, params = {})
      put "crm/locations/#{id}", params
    end

    def delete(id)
      delete "crm/locations/#{id}"
    end
  end
end