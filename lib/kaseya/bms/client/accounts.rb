module Kaseya::BMS
  class Client::Accounts < Api
    def all(params = {})
      get_many "crm/accounts", params
    end

    def find(id)
      get_one "crm/accounts/#{id}"
    end

    def new(params = {})
      post "crm/accounts", params
    end

    def update(id, params = {})
      put "crm/accounts/#{id}", params
    end

    def delete(id)
      delete "crm/accounts/#{id}"
    end

    def locations(id, params = {})
      get_many "crm/accounts/#{id}/locations", params
    end

    def main_location(id)
      response = get_many("crm/accounts/#{id}/locations", top: 1, filter: "IsMain eq true")
      response.first
    end

    def main_location_id(id)
      (main_location(id) || {})["Id"]
    end

    def notes(id, params = {})
      get_many "crm/accounts/#{id}/notes", params
    end

    def activities(id, params = {})
      get_many "crm/accounts/#{id}/activity", params
    end

    def linked(id, params = {})
      get_many "crm/accounts/#{id}/linkedaccounts", params
    end

    def types(params = {})
      get_many "crm/accounts/types", params
    end

    def new_type(params = {})
      post "crm/accounts/types", params
    end
  end
end