require 'spec_helper'
require 'sphyg/throbber'

module Sphyg
  RSpec.describe Throbber do
    it 'accepts a custom enumerator' do
      ::Sphyg::TestEnum = Struct.new(:frames) { def next; end }
      frames = %w[a]
      message = 'Please wait'
      rate = 0.1
      enum_instance = instance_double('::Sphyg::TestEnum')

      expect(::Sphyg::TestEnum).
        to receive(:new).
        with(frames).
        and_return(enum_instance)
      expect(enum_instance).to receive(:next)

      throbber = described_class.new(message, frames, '::Sphyg::TestEnum', rate)
      allow(throbber).to receive(:loop).and_yield
      throbber.run
    end
  end
end
