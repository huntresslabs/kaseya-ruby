module Kaseya::BMS
  class Client::Tickets < Api
    def new(params = {})
      post "servicedesk/tickets", params
    end
  end
end