module Sphyg
  module Strategies
    # Strategy template
    class Base
      class AbstractMethodCall < StandardError; end
      def initialize(message, frames, pulse_rate)
        @message = message
        @frames = frames
        @pulse_rate = pulse_rate
      end

      def run
        raise AbstractMethodCall, 'Implement :run in a child class'
      end
    end
  end
end
