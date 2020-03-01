module Kaseya
  class Result
    attr_reader :raw

    delegate_missing_to :@raw

    def initialize(result)
      @raw = result || {}
    end

    def [](key)
      # Convert snake-case symbols to camel-case strings
      key = key.to_s.camelize if key.is_a?(Symbol)
      @raw[key]
    end
  end
end