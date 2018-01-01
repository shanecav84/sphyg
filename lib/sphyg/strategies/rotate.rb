require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Cyclically shifts frames along sequence
    class Rotate < Base
      def run
        @frames.rotate!.join
      end
    end
  end
end
