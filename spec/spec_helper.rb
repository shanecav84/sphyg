require 'rspec'

Thread.abort_on_exception = true

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end
