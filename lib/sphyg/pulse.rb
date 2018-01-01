require 'sphyg/throbber'

module Sphyg
  # Handles threading and running the throbber
  class Pulse
    def initialize(message, options = {})
      @message = message
      @options = ::Sphyg::THROBBERS[:wave].merge(options)
    end

    def run(&blk)
      # Note: the block will continue to run even if our throbber crashed. This
      # is more user-frindly than setting `abort_on_exception` for our thread.
      # TODO: use `Thread#reporting_on_exception` for Ruby versions >= 2.4
      thr = ::Thread.new { throbber.run }
      yield blk
    ensure
      thr.kill
      print "\n"
    end

    private

    def throbber
      ::Sphyg::Throbber.new(
        @message,
        @options[:frames],
        @options[:enumerator],
        @options[:rate]
      )
    end
  end
end
