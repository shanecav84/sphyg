require "sphyg/pulse"
require "sphyg/version"

module Sphyg
  def self.pulse(message, options, &blk)
    ::Sphyg::Pulse.new(message, options).run { yield blk }
  end
end
