module Sphyg
  module Strategies
    # Strategy template
    class Base
      class AbstractMethodCall < StandardError; end
      def initialize(message, frames)
        @message = message
        @frames = frames
      end

      def run
        raise AbstractMethodCall, 'Implement :run in a child class'
      end
    end
  end
end
