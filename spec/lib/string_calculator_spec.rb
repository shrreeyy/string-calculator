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

    it 'returns the sum when the input contains comma-delimited numbers' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it 'returns the sum when the input contains newline-delimited numbers' do
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end
  end
end
