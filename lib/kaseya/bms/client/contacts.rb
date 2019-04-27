module Kaseya::BMS
  class Client::Contacts < Api
    def all(params = {})
      get_many "crm/contacts", params
    end

    def find(id)
      get_one "crm/contacts/#{id}"
    end

    def new(params = {})
      post "crm/contacts", params
    end

    def update(id, params = {})
      put "crm/contacts/#{id}", params
    end

    def delete(id)
      delete "crm/contacts/#{id}"
    end

    def notes(id, params = {})
      get_many "crm/contacts/#{id}/notes", params
    end
  end
end