module Sphyg
  module Enumerators
    # Enumerator template
    class Base
      class AbstractMethodCall < StandardError; end

      def initialize(message, frames)
        @message = message
        @frames = frames
      end

      # `next` is called at each iteration of a throbber's existance. It
      # returns the throbber state to display. For example, simply looping
      # a given array is implemented in 'Enumerators::Cycle'.
      def next
        raise AbstractMethodCall, 'Implement :run in a child class'
      end
    end
  end
end
