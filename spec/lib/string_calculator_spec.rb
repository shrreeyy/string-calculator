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

    it 'returns the sum when the input contains both comma and newline-delimited numbers' do
      expect(StringCalculator.add("1,2\n3,4")).to eq(10)
    end

    it 'returns the sum when the input contains a custom delimiter' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception when negative numbers are provided' do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error(RuntimeError, "negative numbers not allowed: -2, -4")
    end

    it 'returns the sum of many numbers with a custom delimiter' do
      expect(StringCalculator.add("//|\n1|2|3|4|5")).to eq(15)
    end

    it 'ignores numbers greater than 1000 in the sum' do
      expect(StringCalculator.add("1,2,3,4,1001")).to eq(10)
    end
  end
end
