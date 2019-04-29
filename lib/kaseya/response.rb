module Kaseya
  class Response
    attr_reader :code, :status, :error, :result

    delegate_missing_to :@result

    def initialize(response)
      @code = response["ResponseCode"]
      @status = response["Status"]
      @error = response["Error"]
      @result = Result.new(response["Result"])
    end

    def error?
      @error != "None"
    end

    def success?
      !error?
    end
  end
end