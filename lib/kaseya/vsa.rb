module Kaseya
  module VSA
    require_relative "vsa/client"
    require_relative "vsa/configuration"
    require_relative "vsa/connection"

    extend Configuration

    def self.authenticate(host, username, password)
      nonce = SecureRandom.random_number(2**16).to_s
      raw2 = Digest::SHA256.hexdigest(password)
      pass2 = Digest::SHA256.hexdigest(Digest::SHA256.hexdigest(password + username) + nonce)
      raw1 = Digest::SHA1.hexdigest(password)
      pass1 = Digest::SHA1.hexdigest(Digest::SHA1.hexdigest(password + username) + nonce)

      auth_string = "user=#{username},pass2=#{pass2},pass1=#{pass1},rpass2=#{raw2},rpass1=#{raw1},rand2=#{nonce}"
      auth = Base64.strict_encode64(auth_string)

      conn = Faraday.new(url: "https://#{host}/api/v1.0", ssl: { verify: !debug }) do |faraday|
        faraday.authorization :Basic, auth
        faraday.request :url_encoded
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end

      response = Kaseya::Response.new conn.get("auth").body
      connection = Connection.new(host, response[:api_token])
      Client.new(connection)
    end
  end
end