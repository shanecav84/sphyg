require 'sphyg/enumerators/cycle'
require 'sphyg/enumerators/rotate'

module Sphyg
  # Generates and displays a throbber with a message
  class Throbber
    def initialize(message, frames, enumerator, rate)
      @message = message
      @frames = frames
      @enumerator = Object.const_get(enumerator).new(@frames)
      @rate = rate
    end

    def run
      loop do
        print_throbber_iteration
        sleep @rate
      end
    end

    private

    # For unitary-frame loops, if a frame is longer than its counterparts,
    # then it will not be completely replaced by the following frame. This
    # padding ensures that each line is long enough to overwrite the previous
    # frame.
    def padding
      @_padding ||= "\s" * @frames.max_by(&:length).length
    end

    def print_throbber_iteration
      print format "%<message>s %<enumeration>s%<padding>s\r",
        message: @message,
        enumeration: @enumerator.next,
        padding: padding
    end
  end
end
