require 'sphyg/enumerators/base'

module Sphyg
  module Enumerators
    # Loops through each individual frame of the given sequence.
    # Just like Enumerator#next but wraps around the array.
    class Cycle < Base
      def next
        @frames_index ||= 0
        @frames[(@frames_index += 1) % @frames.length]
      end
    end
  end
end
