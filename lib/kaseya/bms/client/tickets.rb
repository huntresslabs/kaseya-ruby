module Kaseya::BMS
  class Client::Tickets < Api
    def new(params = {})
      post "servicedesk/tickets", params
    end

    def find(id)
      get_one "servicedesk/tickets/#{id}"
    end
  end
end