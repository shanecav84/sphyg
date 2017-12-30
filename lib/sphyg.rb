require 'sphyg/pulse'
require 'sphyg/version'

module Sphyg
  # Presents a message and throbber
  # Params:
  # +message+:: friendly +string+ to display that indicates a command is running
  #   for example, 'Please wait'
  # +options+:: configuration +hash+. Currently only uses the +:kind+ option to
  #   configure which throbber to use. Defaults to +{ kind: :wave }+
  # +&blk+:: a +block+ containing a long-running command to run while displaying
  #   the message and throbber
  def self.pulse(message, options = nil, &blk)
    ::Sphyg::Pulse.new(message, options).run { yield blk }
  end
end
