require 'sphyg/throbbers'

module Sphyg
  # Handles threading and running the throbber
  class Pulse
    def initialize(message, options = nil)
      @message = message
      @options = options
      @kind = @options[:kind] || :wave
    end

    def run(&blk)
      thr = Thread.new { run_throbber }
      yield blk
    ensure
      Thread.kill(thr)
      print "\n"
    end

    private

    def run_throbber
      case @kind
      when :ascii, :elipsis, :heart, :heroku, :moon, :time
        unitary_frame_loop
      when :wave then wave
      else wave
      end
    end

    def unitary_frame_loop
      ::Sphyg::Throbbers::UnitaryFrameLoop.new(@message, @kind).run
    end

    def wave
      ::Sphyg::Throbbers::Wave.new(@message, @kind).run
    end
  end
end
