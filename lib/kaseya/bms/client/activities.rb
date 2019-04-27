module Kaseya::BMS
  class Client::Activities < Api
    def all(params = {})
      get_many "crm/activity", params
    end

    def find(id)
      get_one "crm/activity/#{id }"
    end

    def new(params = {})
      post "crm/activity", params
    end

    def update(id, params = {})
      put "crm/activity/#{id}", params
    end

    def notes(id, params = {})
      get_many "crm/activity/#{id}/notes", params
    end
  end
end