module Sphyg
  # Generates and displays a throbber with a message
  class Throbber
    attr_accessor :frames
    attr_accessor :message
    attr_accessor :pulse_rate

    def initialize(message, kind)
      @message = message
      throbber = ::Sphyg::Throbbers::KINDS[kind]
      @frames = throbber[:frames]
      @pulse_rate = throbber[:pulse_rate]
    end

    def run; end

    private

    # For unitary-frame loops, if a frame is longer than its counterparts, then
    # it will not be completely replaced by the following frame. This padding
    # ensures that each line is long enough to overwrite the previous frame.
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
