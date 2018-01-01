require 'rspec'
require 'sphyg/pulse'
require 'sphyg/throbber'

Thread.abort_on_exception = true

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed

  config.before(:each) do
    allow_any_instance_of(::Sphyg::Pulse).to receive(:print).with("\n")
    allow_any_instance_of(::Sphyg::Throbber).to receive(:print)
  end
end
