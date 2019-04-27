module Kaseya::BMS
  class Collection
    attr_reader :total, :code, :status, :error, :result

    delegate_missing_to :@results

    def initialize(response)
      @total = response["TotalRecords"]
      @code = response["ResponseCode"]
      @status = response["Status"]
      @error = response["Error"]
      @results = (response["Result"] || []).map { |r| Result.new r }
    end
  end
end