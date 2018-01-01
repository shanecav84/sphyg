require 'spec_helper'
require 'sphyg'
require 'sphyg/pulse'

module Sphyg
  RSpec.describe Pulse do
    Thread.abort_on_exception = true

    Sphyg::THROBBERS.each do |kind, config|
      it "using :#{kind} doesn't raise an error" do
        message = "Testing #{kind}"
        expect { described_class.new(message, config).run { sleep 1 } }.
          to_not raise_error
      end
    end
  end
end
