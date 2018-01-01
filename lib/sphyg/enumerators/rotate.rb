require 'sphyg/enumerators/base'

module Sphyg
  module Enumerators
    # Rotates the whole array of frames at each iteration
    class Rotate < Base
      def next
        @frames.rotate!.join
      end
    end
  end
end
