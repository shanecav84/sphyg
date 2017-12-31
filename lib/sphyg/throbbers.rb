module Sphyg
  THROBBERS = {
    ascii: { frames: %w[| / - \\], pulse_rate: 0.1 },
    elipsis: { frames: ['.', '..', '...', '..'], pulse_rate: 0.2 },
    heart: { frames: %w[❤️ 🧡 💛 💚 💙 💜], pulse_rate: 0.1 },
    heroku: { frames: %w[⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷], pulse_rate: 0.1 },
    moon: { frames: %w[🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘], pulse_rate: 0.2 },
    time: { frames: %w[🕛 🕐 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚], pulse_rate: 1 },
    wave: { frames: %w[⡀ ⠄ ⠂ ⠁ ⠂ ⠄], pulse_rate: 0.1 }
  }.freeze
end
