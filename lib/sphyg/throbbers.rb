require 'sphyg/throbber'

module Sphyg
  module Throbbers
    KINDS = {
      ascii: { frames: %w[| / - \\], pulse_rate: 0.1 },
      elipsis: { frames: %w[. .. ... ..], pulse_rate: 0.2 },
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
        current_frames = frames.dup
        loop do
          print_message_and_pulser(current_frames.join)
          current_frames << cycle_frames(current_frames, frames_index)
          sleep pulse_rate
        end
      end

      private

      def cycle_frames(current_frames, current_frames_index)
        current_frames.shift
        new_frames_index = (current_frames_index + 1) % current_frames.length
        current_frames[new_frames_index]
      end
    end
  end
end
