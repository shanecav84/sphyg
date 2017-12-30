require 'spec_helper'
require 'sphyg/frames'
require 'sphyg/pulse'

module Sphyg
  RSpec.describe Pulse do
    Sphyg::FRAMES.each_key do |kind|
      it "using :#{kind} doesn't raise an error" do
          message = "Testing #{kind}"
          expect { described_class.new(message, { kind: kind }).run { sleep 1 } }.
            to_not raise_error
      end
    end
  end
end
