module Sphyg
  module Strategies
    # Strategy template
    class Base
      attr_reader :message
      attr_reader :frames
      attr_reader :pulse_rate

      def initialize(message, frames, pulse_rate)
        @message = message
        @frames = frames
        @pulse_rate = pulse_rate
      end

      def run; end

      private

      # For unitary-frame loops, if a frame is longer than its counterparts,
      # then it will not be completely replaced by the following frame. This
      # padding ensures that each line is long enough to overwrite the previous
      # frame.
      def padding
        "\s" * frames.max_by(&:length).length
      end

      def print_message_and_pulser(pulser)
        print format "%<message>s %<pulser>s%<padding>s\r",
          message: message,
          pulser: pulser,
          padding: padding
      end
    end
  end
end
