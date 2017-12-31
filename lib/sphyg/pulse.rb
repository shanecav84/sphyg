require 'sphyg/throbbers'

module Sphyg
  # Generates and displays a message and throbber for a long-running command
  class Pulse
    def initialize(message, options)
      @message = message
      @options = options || { kind: :wave }
      @throbber = Sphyg::THROBBERS[@options[:kind]].dup
    end

    def run(&blk)
      thr = Thread.new do
        case @options[:kind]
        when :ascii then unitary_frame_loop
        when :elipsis then unitary_frame_loop
        when :heart then unitary_frame_loop
        when :heroku then unitary_frame_loop
        when :moon then unitary_frame_loop
        when :time then unitary_frame_loop
        when :wave then wave
        else wave
        end
      end

      yield blk
    ensure
      Thread.kill(thr)
      print "\n"
    end

    private

    def frames
      @throbber[:frames]
    end

    # For unitary-frame loops, if a frame is longer than its counterparts, then
    # it will not be completely replaced by the following frame. This padding
    # ensures that each line is long enough to overwrite the previous frame.
    def padding
      "\s" * frames.max_by(&:length).length
    end

    def print_message_and_pulser(pulser)
      print format "%<message>s %<pulser>s%<padding>s\r",
        message: @message,
        pulser: pulser,
        padding: padding
    end

    # Loops through each individual frame of the given sequence
    def unitary_frame_loop
      frames_index = 0
      loop do
        print_message_and_pulser(frames[frames_index])
        frames_index = (frames_index + 1) % frames.length
        sleep @throbber[:pulse_rate]
      end
    end

    # Cyclically shifts frames along sequence
    def wave
      frames_index = 0
      wave = frames
      loop do
        print_message_and_pulser(wave.join)
        wave.shift
        frames_index = (frames_index + 1) % frames.length
        wave << frames[frames_index]
        sleep 0.1
      end
    end
  end
end
