
RSpec.describe Kaseya::BMS::Client::Tickets do
  subject { ::Kaseya::BMS.authenticate(*auth_args) }

  let(:ticket) { subject.tickets.find(17) }

  describe ".find" do
    before do
      oauth_stub_request
      ticket_stub_request
    end

    it "returns a ticket" do
      expect(ticket).to be_a(Kaseya::Response)
      expect(ticket.result["Id"]).to eq(17)
      expect(ticket.result["Title"]).to eq("Test Ticket")
    end
  end
end
