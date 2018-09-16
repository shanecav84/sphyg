require 'spec_helper'
require 'sphyg'

RSpec.describe Sphyg do
  describe '.pulse' do
    it 'passes along the parameters' do
      message = 'Please wait'
      options = { kind: :wave }
      mock_pulse = double('Sphyg::Pulse')

      expect(::Sphyg::Pulse).
        to receive(:new).
        with(message, options).
        and_return(mock_pulse)
      expect(mock_pulse).to receive(:run).and_yield

      described_class.pulse(message, options) {}
    end

    describe 'options argument' do
      it "doesn't crash when passed nil" do
        message = 'Please wait'
        expect { described_class.pulse(message) {} }.
          to_not raise_error
      end

      it "doesn't crash when passed an empty hash" do
        message = 'Please wait'
        expect { described_class.pulse(message, {}) {} }.
          to_not raise_error
      end
    end
  end
end
