require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Cyclically shifts frames along sequence
    class Wave < Base
      def run
        @frames.rotate!.join
      end
    end
  end
end
