require 'spec_helper'

require_relative '../../app/lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 when the input is an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end
  end
end
