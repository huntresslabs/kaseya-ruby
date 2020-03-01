module Kaseya::BMS
  class BMSError < Kaseya::ApiError
    attr_reader :response, :error, :description

    def initialize(response)
      @response = response
      if @response&.body
        @error = @response.body["error"]
        @description = @response.body["error_description"]
      end

      super("#{@error || 'Error'}: #{@description || 'Unknown API error'}")
    end
  end
end