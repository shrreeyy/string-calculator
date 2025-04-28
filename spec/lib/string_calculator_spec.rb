require 'spec_helper'

require_relative '../../app/lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 when the input is an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself when the input is a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end
  end
end
