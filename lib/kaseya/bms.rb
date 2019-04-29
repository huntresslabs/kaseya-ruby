module Kaseya
  module BMS
    require_relative "bms/api"
    require_relative "bms/client"
    require_relative "bms/configuration"
    require_relative "bms/connection"
    require_relative "bms/exceptions"
    require_relative "bms/version"

    extend Configuration

    TICKET_SOURCES = {
      client_portal:      0,
      phone:              1,
      in_person:          2,
      on_site:            3,
      email:              4,
      monitoring_system:  5,
      voice_mail:         6,
      verbal:             7,
      other:              8,
      recurring:          9,
    }

    LIST_TYPES = {
      ticket_type: 1,
    }

    def self.authenticate(host, username, password, tenant)
      params = {
        grant_type: "password",
        username: username,
        password: password,
        tenant: tenant
      }

      conn = Faraday.new(url: "https://#{host}/api", ssl: { verify: !debug }) do |faraday|
        faraday.request :url_encoded
        faraday.response :json
        faraday.response :raise_error
        faraday.adapter Faraday.default_adapter
      end

      response = conn.post('token', params)
      connection = Connection.new(host, response.body["access_token"], response.body["expires_in"])
      Client.new(connection)
    end
  end
end