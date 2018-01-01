require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Cyclically shifts frames along sequence
    class Wave < Base
      def run
        current_frames = frames.dup
        loop do
          print_message_and_pulser(current_frames.join)
          current_frames.rotate!
          sleep pulse_rate
        end
      end
    end
  end
end
