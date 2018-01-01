require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Cyclically shifts frames along sequence
    class Wave < Base
      def run
        loop do
          print_message_and_pulser(frames.join)
          frames.rotate!
          sleep pulse_rate
        end
      end
    end
  end
end
