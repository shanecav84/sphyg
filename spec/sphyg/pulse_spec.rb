require 'spec_helper'
require 'sphyg/frames'
require 'sphyg/pulse'

module Sphyg
  RSpec.describe Pulse do
    it "doesn't raise an error" do
      Sphyg::FRAMES.each_key do |kind|
        message = 'Test message'
        expect { described_class.new(message, { kind: kind}).run { sleep 1 } }.
          to_not raise_error
      end
    end
  end
end
