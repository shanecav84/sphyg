require 'sphyg/frames'

module Sphyg
  class Pulse
    def initialize(message, options = { kind: :wave })
      @message = message
      @options = options
      @frames = Sphyg::FRAMES[options[:kind]]
    end

    def run(&blk)
      thr = Thread.new do
        case @options[:kind]
        when :ascii then unitary_frame_loop(frames(:ascii), 0.1)
        when :elipsis then unitary_frame_loop(frames(:elipsis), 0.2)
        when :heart then unitary_frame_loop(frames(:heart), 0.1)
        when :heroku then unitary_frame_loop(frames(:heroku), 0.1)
        when :moon then unitary_frame_loop(frames(:moon), 0.2)
        when :time then unitary_frame_loop(frames(:time), 1)
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

    def frames(kind)
      Sphyg::FRAMES[kind.to_sym].dup
    end

    # For unitary-frame loops, if a frame is longer than its counterparts, then it will not
    # be completely replaced by the following frame. This padding ensures that each line
    # is longer enough to overwrite the previous frame.
    def padding
      "\s" * @frames.max { |a, b| a.length <=> b.length }.length
    end

    def print_message_and_pulser(pulser)
      print format "%s %s%s\r", @message, pulser, padding
    end

    def unitary_frame_loop(sequence, pulse_rate = 0.1)
      frames_index = 0
      loop do
        print_message_and_pulser(sequence[frames_index])
        frames_index = (frames_index + 1) % sequence.length
        sleep pulse_rate
      end
    end

    def wave
      frames_index = 0
      wave = frames(:wave)
      loop do
        print_message_and_pulser(wave.join)
        wave.shift
        frames_index = (frames_index + 1) % frames(:wave).length
        wave << frames(:wave)[frames_index]
        sleep 0.1
      end
    end
  end
end
