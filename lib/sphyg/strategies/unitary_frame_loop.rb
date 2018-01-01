require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Loops through each individual frame of the given sequence
    class UnitaryFrameLoop < Base
      def run
        @frames_index ||= 0
        @frames[(@frames_index += 1) % @frames.length]
      end
    end
  end
end
