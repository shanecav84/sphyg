require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Loops through each individual frame of the given sequence
    class UnitaryFrameLoop < Base
      def run
        frames_index = 0
        loop do
          print_message_and_pulser(frames[frames_index])
          frames_index = (frames_index + 1) % frames.length
          sleep pulse_rate
        end
      end
    end
  end
end
