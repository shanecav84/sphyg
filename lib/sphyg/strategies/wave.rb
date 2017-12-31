require 'sphyg/strategies/base'

module Sphyg
  module Strategies
    # Cyclically shifts frames along sequence
    class Wave < Base
      def run
        frames_index = 0
        current_frames = frames.dup
        loop do
          print_message_and_pulser(current_frames.join)
          current_frames << cycle_frames(current_frames, frames_index)
          sleep pulse_rate
        end
      end

      private

      def cycle_frames(current_frames, current_frames_index)
        current_frames.shift
        new_frames_index = (current_frames_index + 1) % current_frames.length
        current_frames[new_frames_index]
      end
    end
  end
end
