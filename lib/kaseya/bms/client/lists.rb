module Kaseya::BMS
  class Client
    class Lists < Api
      def find(id, params = {})
        get_many "system/lists/#{id}", params
      end

      def ticket_types(params = {})
        find(LIST_TYPES[:ticket_type], params)
      end
    end
  end
end