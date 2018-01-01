require 'sphyg/enumerators/cycle'
require 'sphyg/enumerators/rotate'

module Sphyg
  # Generates and displays a throbber with a message
  class Throbber
    def initialize(message, kind)
      @message = message
      @kind = kind || :wave
      @frames = KINDS[@kind][:frames]
      @pulse_rate = KINDS[@kind][:pulse_rate]
    end

    def run
      loop do
        print_message_and_enumeration(enumerator.next)
        sleep @pulse_rate
      end
    end

    private

    # For unitary-frame loops, if a frame is longer than its counterparts,
    # then it will not be completely replaced by the following frame. This
    # padding ensures that each line is long enough to overwrite the previous
    # frame.
    def padding
      "\s" * @frames.max_by(&:length).length
    end

    def print_message_and_enumeration(enumeration)
      print format "%<message>s %<enumeration>s%<padding>s\r",
        message: @message,
        enumeration: enumeration,
        padding: padding
    end

    def enumerator
      @_strategy ||= begin
        case @kind
        when :ascii, :elipsis, :heart, :heroku, :moon, :time
          ::Sphyg::Enumerators::Cycle.new(@frames)
        else
          ::Sphyg::Enumerators::Rotate.new(@frames)
        end
      end
    end
  end
end
