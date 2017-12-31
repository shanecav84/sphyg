require 'sphyg/throbber'

module Sphyg
  # Handles threading and running the throbber
  class Pulse
    def initialize(message, options = nil)
      @message = message
      @options = options || {}
    end

    def run(&blk)
      thr = ::Thread.new { ::Sphyg::Throbber.new(@message, @options[:kind]).run }
      yield blk
    ensure
      Thread.kill(thr)
      print "\n"
    end
  end
end
