
def auth_args
  [
    ENV["BMS_HOST"],
    ENV["BMS_USERNAME"],
    ENV["BMS_PASSWORD"],
    ENV["BMS_TENANT"]
  ]
end

def oauth_stub_request
  body = {
    "access_token" => "access_token",
    "token_type" => "bearer",
    "expires_in" => 7775999
  }.to_json

  stub_request(:post, "https://#{ENV["BMS_HOST"]}/api/token")
    .with(
      body: { "grant_type" => "password",
              "password" => ENV["BMS_PASSWORD"],
              "tenant" => ENV["BMS_TENANT"],
              "username" => ENV["BMS_USERNAME"] },
      headers: { "Accept" => "*/*" })
    .to_return(status: 200, body: body)
end

def ticket_stub_request
  body = {
    "ResponseCode" => 0,
    "Status" => "OK",
    "Error" => "None",
    "Result" => {
      "Id" => 17,
      "TicketNumber" => "1-234",
      "Title" => "Test Ticket",
      "Details" => "This is a test ticket.",
      "AccountId" => 34567,
      "AccountName" => "AccountName",
      "AccountLocationId" => 45678,
      "AccountLocation" => "AccountLocation"
    }
  }.to_json

  headers = {
    "Content-Type" => "application/json"
  }

  stub_request(:get, "https://#{ENV["BMS_HOST"]}/api/servicedesk/tickets/17")
    .with(headers: { "Accept" => "*/*", "Authorization" => "Bearer access_token" })
    .to_return(status: 200, body: body, headers: headers)
end
