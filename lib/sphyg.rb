require 'sphyg/pulse'
require 'sphyg/version'

# Top-level namespace
module Sphyg
  THROBBERS = {
    ascii: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[| / - \\],
      rate: 0.1
    },
    elipsis: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[. .. ... ..],
      rate: 0.2
    },
    heart: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[🧡 💛 💚 💙 💜],
      rate: 0.1
    },
    heroku: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷],
      rate: 0.1
    },
    moon: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘],
      rate: 0.2
    },
    time: {
      enumerator: '::Sphyg::Enumerators::Cycle',
      frames: %w[🕛 🕐 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚],
      rate: 1
    },
    wave: {
      enumerator: '::Sphyg::Enumerators::Rotate',
      frames: %w[⡀ ⠄ ⠂ ⠁ ⠂ ⠄],
      rate: 0.1
    }
  }.freeze

  # Presents a message and throbber
  # Params:
  # +message+:: friendly +string+ to display that indicates a command is running
  #   for example, 'Please wait'
  # +options+:: configuration +hash+
  # +&blk+:: a +block+ containing a long-running command to run while displaying
  #   the message and throbber
  def self.pulse(message, options = {}, &blk)
    ::Sphyg::Pulse.new(message, options).run { yield blk }
  end
end
