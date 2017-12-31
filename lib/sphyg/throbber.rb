require 'sphyg/strategies/unitary_frame_loop'
require 'sphyg/strategies/wave'

module Sphyg
  # Generates and displays a throbber with a message
  class Throbber
    KINDS = {
      ascii: { frames: %w[| / - \\], pulse_rate: 0.1 },
      elipsis: { frames: %w[. .. ... ..], pulse_rate: 0.2 },
      heart: { frames: %w[❤️ 🧡 💛 💚 💙 💜], pulse_rate: 0.1 },
      heroku: { frames: %w[⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷], pulse_rate: 0.1 },
      moon: { frames: %w[🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘], pulse_rate: 0.2 },
      time: { frames: %w[🕛 🕐 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚], pulse_rate: 1 },
      wave: { frames: %w[⡀ ⠄ ⠂ ⠁ ⠂ ⠄], pulse_rate: 0.1 }
    }.freeze

    def initialize(message, kind)
      @message = message
      @kind = kind || :wave
      @strategy_params = [
        message,
        KINDS[kind][:frames],
        KINDS[kind][:pulse_rate]
      ]
    end

    def run
      strategy.run
    end

    private

    def strategy
      case @kind
      when :ascii, :elipsis, :heart, :heroku, :moon, :time
        ::Sphyg::Strategies::UnitaryFrameLoop.new(*@strategy_params)
      when :wave
        ::Sphyg::Strategies::Wave.new(*@strategy_params)
      end
    end
  end
end