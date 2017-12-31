require 'sphyg/throbber'

module Sphyg
  module Throbbers
    KINDS = {
      ascii: { frames: %w[| / - \\], pulse_rate: 0.1 },
      elipsis: { frames: ['.', '..', '...', '..'], pulse_rate: 0.2 },
      heart: { frames: %w[❤️ 🧡 💛 💚 💙 💜], pulse_rate: 0.1 },
      heroku: { frames: %w[⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷], pulse_rate: 0.1 },
      moon: { frames: %w[🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘], pulse_rate: 0.2 },
      time: { frames: %w[🕛 🕐 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚], pulse_rate: 1 },
      wave: { frames: %w[⡀ ⠄ ⠂ ⠁ ⠂ ⠄], pulse_rate: 0.1 }
    }.freeze

    # Loops through each individual frame of the given sequence
    class UnitaryFrameLoop < ::Sphyg::Throbber
      def run
        frames_index = 0
        loop do
          print_message_and_pulser(frames[frames_index])
          frames_index = (frames_index + 1) % frames.length
          sleep pulse_rate
        end
      end
    end

    # Cyclically shifts frames along sequence
    class Wave < ::Sphyg::Throbber
      def run
        frames_index = 0
        wave = frames.dup
        loop do
          print_message_and_pulser(wave.join)
          wave.shift
          frames_index = (frames_index + 1) % frames.length
          wave << frames[frames_index]
          sleep pulse_rate
        end
      end
    end
  end
end
