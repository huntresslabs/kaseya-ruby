module Kaseya::VSA
  class VSAError < Kaseya::ApiError
    attr_reader :response, :code, :error

    def initialize(response)
      @response = response
      if @response&.body
        @code = @response.body["ResponseCode"]
        @error = @response.body["Error"]
      end

      super("Error (#{@code}): #{@error || 'Unknown API error'}")
    end
  end
end