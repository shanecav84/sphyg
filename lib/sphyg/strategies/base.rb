module Sphyg
  module Strategies
    # Strategy template
    class Base
      def initialize(message, frames, pulse_rate)
        @message = message
        @frames = frames
        @pulse_rate = pulse_rate
      end

      def run; end
    end
  end
end
