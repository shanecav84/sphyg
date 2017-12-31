require 'sphyg/throbber'

module Sphyg
  # Handles threading and running the throbber
  class Pulse
    def initialize(message, options = nil)
      @message = message
      @options = options || {}
    end

    def run(&blk)
      # Note: the block will continue to run even if our throbber crashed. This
      # is more user-frindly than setting `abort_on_exception` for our thread.
      # TODO: use `Thread#reporting_on_exception` for Ruby versions >= 2.4
      thr = ::Thread.new { ::Sphyg::Throbber.new(@message, @options[:kind]).run }
      yield blk
    ensure
      Thread.kill(thr)
      print "\n"
    end
  end
end
